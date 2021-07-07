import os
# 綁定 5000 port
bind = "0.0.0.0:5000"
# 同時執行進程數為 當前 CPU 個數 *2+1
workers = os.cpu_count() * 2 + 1