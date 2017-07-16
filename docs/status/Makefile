all:  figures

pull:
	git pull -s recursive -X theirs

heartbeats: heartbeats_ping

heartbeats_ping:
	bash index.md.sh > index.md

heartbeats_push:
	git commit index.md -m "STATUS: Updated heartbeats"
	git push

figures:
	mkdir figures

hourly: last_hour last_day

daily: last_week last_month

weekly: last_year

last_hour: figures
	wget --quiet -O figures/cpu_load_last_hour.gif "http://cclc01.ucsf.edu/ganglia/graph.php?g=load_report&z=medium&c=cclc01&m=load_one&r=hour"

last_day: figures
	wget --quiet -O figures/cpu_load_last_day.gif "http://cclc01.ucsf.edu/ganglia/graph.php?g=load_report&z=medium&c=cclc01&m=load_one&r=day"

last_week: figures
	wget --quiet -O figures/cpu_load_last_week.gif "http://cclc01.ucsf.edu/ganglia/graph.php?g=load_report&z=medium&c=cclc01&m=load_one&r=week"

last_month: figures
	wget --quiet -O figures/cpu_load_last_month.gif "http://cclc01.ucsf.edu/ganglia/graph.php?g=load_report&z=medium&c=cclc01&m=load_one&r=month"

last_year: figures
	wget --quiet -O figures/cpu_load_last_year.gif "http://cclc01.ucsf.edu/ganglia/graph.php?g=load_report&z=medium&c=cclc01&m=load_one&r=year"

deploy:
	git commit figures/ -m "STATUS: Updated figures"
	git push
