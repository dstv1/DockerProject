Instruction for deploying container ( Nginx server with html page using Alpine Linux for base OS )

1. Docker installation.

dnf update -y && \
dnf install -y yum-utils && \
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
dnf install -y docker-ce && \
sudo systemctl start docker && \
sudo systemctl enable docker && \
sudo dnf install git -y

docker --version
sudo docker run hello-world
docker container exec -it hello-world bash
docker run -d
docker start/stop con id
docker ps
docker ps -a
docker images

docker stop $(docker ps -q) && \
docker rm $(docker ps -aq) && \
docker rmi -f $(docker images -q)

mkdir $HOME/DockerProject
cd $HOME/DockerProject/
nano index.html   ***see below
nano Dockerfile

  FROM nginx:alpine
  RUN apk add --no-cache bash
  COPY index.html /usr/share/nginx/html
  EXPOSE 80

docker build -t img-nginx . && \
docker run --name contr-nginx -p 8080:80 -d img-nginx
docker container exec -it contr-nginx bash

2. Git installation.
   
dnf install git -y
git remote add origin https://dstv1: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@github.com/dstv1//DockerProject.git
git init
git branch -M main
echo "# DockerProject" >> README.md
git add Dockerfile  index.html  README.md
git add .
git commit -m "first commit"
git push origin main
git push --force origin main

git reset --hard HEAD~1
git remote remove origin
git branch -D name

git switch -c main2
git add .
git commit -m "v2"
git push origin main2



***HTML page code***

nano index.html

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Nginx!</title>
    <style>
        :root {
            --primary-color: #009639;
            --secondary-color: #2c3e50;
            --text-color: #333;
            --light-gray: #f5f5f5;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            color: var(--text-color);
            background-color: var(--light-gray);
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            min-height: 100vh;
        }
        header {
            text-align: center;
            padding: 30px 0;
            border-bottom: 1px solid #eee;
        }
        h1 {
            color: var(--primary-color);
            margin-bottom: 10px;
        }
        h2 {
            color: var(--secondary-color);
            border-bottom: 1px solid #eee;
            padding-bottom: 5px;
        }
        .logo {
            height: 100px;
            margin: 20px 0;
            transition: transform 0.3s ease;
        }
        .logo:hover {
            transform: scale(1.05);
        }
        .content {
            padding: 20px 0;
        }
        ul {
            padding-left: 20px;
        }
        li {
            margin-bottom: 8px;
        }
        a {
            color: var(--primary-color);
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        footer {
            text-align: center;
            padding: 30px 0;
            border-top: 1px solid #eee;
            font-size: 0.9em;
            color: #7f8c8d;
            margin-top: 30px;
        }
        .status-badge {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8em;
            margin-left: 10px;
        }
        @media (max-width: 600px) {
            .container {
                padding: 10px;
            }
            .logo {
                height: 70px;
            }
            h1 {
                font-size: 1.5em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Welcome to Nginx! <span class="status-badge">Running</span></h1>
            <img src="https://download.logo.wine/logo/Nginx/Nginx-Logo.wine.png" alt="Nginx Logo" class="logo">
        </header>

        <div class="content">
            <p>If you see this page, the Nginx web server is successfully installed and working on your system.</p>
            
            <h2>Getting Started</h2>
            <ul>
                <li><strong>Document Root:</strong> <code>/usr/share/nginx/html</code> or <code>/var/www/html</code></li>
                <li><strong>Configuration:</strong> <code>/etc/nginx/nginx.conf</code></li>
                <li><strong>Sites Available:</strong> <code>/etc/nginx/sites-available/</code></li>
                <li><strong>Logs:</strong> <code>/var/log/nginx/</code></li>
            </ul>

            <h2>Next Steps</h2>
            <ul>
                <li>Upload your website files to the server's document root directory</li>
                <li>Configure virtual hosts for multiple websites</li>
                <li>Set up SSL/TLS with Let's Encrypt for secure HTTPS connections</li>
                <li>Optimize Nginx configuration for better performance</li>
                <li>Set up proper file permissions and ownership</li>
            </ul>

            <h2>Documentation & Resources</h2>
            <ul>
                <li><a href="https://nginx.org/en/docs/" target="_blank" rel="noopener">Official Nginx Documentation</a></li>
                <li><a href="https://wiki.nginx.org/Main" target="_blank" rel="noopener">Nginx Wiki</a></li>
                <li><a href="https://www.digitalocean.com/community/tutorials?q=nginx" target="_blank" rel="noopener">Nginx Tutorials (DigitalOcean)</a></li>
                <li><a href="https://github.com/nginx/nginx" target="_blank" rel="noopener">Nginx GitHub Repository</a></li>
            </ul>

            <h2>Server Information</h2>
            <ul>
                <li><strong>Hostname:</strong> <span id="hostname"></span></li>
                <li><strong>IP Address:</strong> <span id="ip-address"></span></li>
                <li><strong>User Agent:</strong> <span id="user-agent"></span></li>
            </ul>
        </div>

        <footer>
            <p>Thank you for using Nginx.</p>
            <p>Server: <span id="server-info"></span> | Page served on: <span id="timestamp"></span></p>
            <p>Nginx is a high-performance web server and reverse proxy.</p>
        </footer>
    </div>

    <script>
        // Display server information
        document.getElementById('server-info').textContent = 
            window.location.hostname + ' running Nginx';
        
        // Additional client-side information
        document.getElementById('hostname').textContent = window.location.hostname;
        document.getElementById('user-agent').textContent = navigator.userAgent;
        
        // Get client IP (note: this will only show the IP Nginx sees, which might be a proxy)
        fetch('https://api.ipify.org?format=json')
            .then(response => response.json())
            .then(data => {
                document.getElementById('ip-address').textContent = data.ip;
            })
            .catch(() => {
                document.getElementById('ip-address').textContent = 'Not available';
            });
        
        // Display current timestamp
        const now = new Date();
        document.getElementById('timestamp').textContent = now.toLocaleString();
    </script>
</body>
</html>


