#!/bin/bash
cd /home/ec2-user

# Instance details via IMDSv2 (shows which server answered)
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 300")
meta() { curl -s -H "X-aws-ec2-metadata-token: $TOKEN" "http://169.254.169.254/latest/meta-data/$1"; }
IID=$(meta instance-id)
AZ=$(meta placement/availability-zone)
ITYPE=$(meta instance-type)

cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Terra Cloud | Terraform Up and Learning</title>
<style>
  *{box-sizing:border-box;margin:0;padding:0}
  body{font-family:"Segoe UI",Roboto,Arial,sans-serif;color:#e8ecff;min-height:100vh;
       background:linear-gradient(135deg,#0b1020,#1b1464,#0b3a6b,#0b1020);
       background-size:300% 300%;animation:bg 18s ease infinite}
  @keyframes bg{0%{background-position:0 50%}50%{background-position:100% 50%}100%{background-position:0 50%}}
  header{text-align:center;padding:90px 20px 50px}
  .badge{display:inline-block;padding:6px 16px;border:1px solid #6c8cff;border-radius:999px;
         font-size:.8rem;letter-spacing:.15em;text-transform:uppercase;color:#9db4ff}
  h1{font-size:clamp(2.4rem,7vw,4.8rem);margin:22px 0 14px;font-weight:800;
     background:linear-gradient(90deg,#7df9ff,#a78bfa,#ff7eb6);
     -webkit-background-clip:text;background-clip:text;color:transparent}
  header p{max-width:680px;margin:0 auto;font-size:1.15rem;line-height:1.6;color:#b9c4f2}
  .live{display:inline-flex;align-items:center;gap:10px;margin-top:30px;padding:10px 20px;
        background:rgba(255,255,255,.07);border-radius:12px;font-family:monospace}
  .dot{width:10px;height:10px;border-radius:50%;background:#3dffa0;
       box-shadow:0 0 12px #3dffa0;animation:p 1.6s infinite}
  @keyframes p{50%{opacity:.3}}
  section{max-width:1100px;margin:0 auto;padding:30px 20px}
  h2{text-align:center;font-size:1.8rem;margin-bottom:28px}
  .flow{display:flex;flex-wrap:wrap;justify-content:center;align-items:center;gap:12px}
  .node{padding:14px 22px;border-radius:12px;background:rgba(255,255,255,.08);
        border:1px solid rgba(255,255,255,.18);font-weight:600}
  .arrow{color:#7df9ff;font-size:1.5rem}
  .grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(230px,1fr));gap:20px}
  .card{padding:26px;border-radius:16px;background:rgba(255,255,255,.07);
        border:1px solid rgba(255,255,255,.14);transition:.3s}
  .card:hover{transform:translateY(-8px);border-color:#7df9ff;box-shadow:0 14px 34px rgba(125,249,255,.18)}
  .card .ic{font-size:2rem}
  .card h3{margin:12px 0 8px}
  .card p{color:#b9c4f2;line-height:1.5;font-size:.95rem}
  footer{text-align:center;padding:50px 20px;color:#8c99cf;font-size:.9rem}
</style>
</head>
<body>
<header>
  <span class="badge">Deployed with Terraform</span>
  <h1>Terra Cloud</h1>
  <p>A load-balanced, auto-scaling web tier on AWS, built from reusable Terraform modules.</p>
  <div class="live"><span class="dot"></span>Served by __IID__ &middot; __AZ__ &middot; __ITYPE__</div>
</header>

<section>
  <h2>How your request travelled</h2>
  <div class="flow">
    <div class="node">Browser</div><span class="arrow">&rarr;</span>
    <div class="node">Application Load Balancer</div><span class="arrow">&rarr;</span>
    <div class="node">Target Group</div><span class="arrow">&rarr;</span>
    <div class="node">Auto Scaling Group</div><span class="arrow">&rarr;</span>
    <div class="node">EC2 __IID__</div>
  </div>
</section>

<section>
  <h2>Built from four modules</h2>
  <div class="grid">
    <div class="card"><div class="ic">🌐</div><h3>Network</h3><p>VPC, subnets, internet gateway and route tables.</p></div>
    <div class="card"><div class="ic">🛡️</div><h3>Security</h3><p>Security groups that let only the load balancer reach the instances on port 80.</p></div>
    <div class="card"><div class="ic">⚖️</div><h3>ALB</h3><p>Listener, target group and health checks that spread traffic across servers.</p></div>
    <div class="card"><div class="ic">🚀</div><h3>Compute</h3><p>Launch template and Auto Scaling group that replace unhealthy servers.</p></div>
  </div>
</section>

<footer>Terraform Up and Learning &middot; with 2 or more instances, refresh to see the server ID change.</footer>
</body>
</html>
EOF

# Fill in the instance details
sed -i "s|__IID__|$IID|g; s|__AZ__|$AZ|g; s|__ITYPE__|$ITYPE|g" index.html

# Same server as before: Python's built-in web server on port 80
nohup python3 -m http.server 80 > nohup.out 2>&1 &
disown