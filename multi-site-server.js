const http = require('http');
const fs = require('fs');
const path = require('path');

const SITES = {
  '/personal-site': '/home/admin/.openclaw/workspace/personal-site',
  '/blog': '/home/admin/.openclaw/workspace/blog',
  '/docs': '/home/admin/.openclaw/workspace/docs-site',
};

const MIME_TYPES = {
  '.html': 'text/html',
  '.css': 'text/css',
  '.js': 'application/javascript',
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.gif': 'image/gif',
  '.svg': 'image/svg+xml',
  '.ico': 'image/x-icon',
  '.json': 'application/json',
};

const server = http.createServer((req, res) => {
  let urlPath = req.url.split('?')[0];
  
  // 根路径重定向到个人主页
  if (urlPath === '/') {
    urlPath = '/personal-site';
  }

  // 查找匹配的站点
  let sitePath = null;
  let basePath = '';
  
  for (const [base, siteDir] of Object.entries(SITES)) {
    if (urlPath === base || urlPath.startsWith(base + '/')) {
      sitePath = siteDir;
      basePath = base;
      break;
    }
  }

  if (!sitePath) {
    res.writeHead(404, { 'Content-Type': 'text/html' });
    res.end('<h1>404 - Site not found</h1>');
    return;
  }

  // 计算文件路径
  let relativePath = urlPath === basePath ? '/index.html' : urlPath.slice(basePath.length);
  
  // Docsify SPA 支持：如果路径为空或是目录，返回 index.html
  if (relativePath === '' || relativePath === '/' || relativePath.endsWith('/')) {
    relativePath = '/index.html';
  }
  
  // 处理带 # 的 SPA 路由（虽然 # 通常不会发送到服务器，但以防万一）
  relativePath = relativePath.split('#')[0];
  
  const filePath = path.join(sitePath, relativePath);

  // 安全检查：防止目录遍历攻击
  const resolvedPath = path.resolve(filePath);
  const resolvedSite = path.resolve(sitePath);
  if (!resolvedPath.startsWith(resolvedSite)) {
    res.writeHead(403, { 'Content-Type': 'text/html' });
    res.end('<h1>403 - Forbidden</h1>');
    return;
  }

  // 读取文件
  fs.readFile(resolvedPath, (err, data) => {
    if (err) {
      if (err.code === 'ENOENT') {
        // 尝试 index.html
        const indexPath = path.join(resolvedPath, 'index.html');
        fs.readFile(indexPath, (err2, data2) => {
          if (err2) {
            res.writeHead(404, { 'Content-Type': 'text/html' });
            res.end('<h1>404 - File not found</h1>');
          } else {
            res.writeHead(200, { 'Content-Type': 'text/html' });
            res.end(data2);
          }
        });
      } else {
        res.writeHead(500, { 'Content-Type': 'text/html' });
        res.end('<h1>500 - Server Error</h1>');
      }
      return;
    }

    const ext = path.extname(filePath).toLowerCase();
    const contentType = MIME_TYPES[ext] || 'application/octet-stream';
    
    res.writeHead(200, { 'Content-Type': contentType });
    res.end(data);
  });
});

const PORT = 3000;
server.listen(PORT, () => {
  console.log(`🚀 Multi-site server running at http://localhost:${PORT}`);
  console.log(`   - http://localhost:${PORT}/personal-site`);
  console.log(`   - http://localhost:${PORT}/blog`);
  console.log(`   - http://localhost:${PORT}/docs`);
});
