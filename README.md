# easybandwidth
简单的利用iptables的流量控制

第一次使用请先执行 iptables -I OUTPUT -s 127.0.0.1 -p tcp --sport 8080

MAX=最大流量，单位M 本实例为监控8080端口流量，超出流量则结束某进程

如果重启系统，则流量重置，也可以使用
iptables -D OUTPUT -s 127.0.0.1 -p tcp --sport 8080
来停止并清零

增加cron计划任务来实现流量限制。推荐每分钟到每五分钟执行一次脚本
