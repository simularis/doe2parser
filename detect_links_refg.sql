
drop view if exists detect_links_refg;
create view detect_links_refg as
select
a."i" as i1,
a."cmd" as cmd1,
a."uname" as uname1,
a."j",
a."key",
a."val",
b."i" as i2,
b."cmd" as cmd2,
b."uname" as uname2
from arg_extended_refg a
join command_list b
on a.val LIKE '%'||b.uname||'%'
;

drop view if exists detect_refg_link_classes;
create view detect_refg_link_classes as
select distinct
cmd1, key, cmd2
from detect_links_refg
order by cmd1, key
;

drop view if exists unknown_refg_link_classes;
create view unknown_refg_link_classes as
select
a.*,
b.*
from detect_refg_link_classes a
left join refg_network_filter b
on b.cmd = a.cmd1 and b.key = a.key
;