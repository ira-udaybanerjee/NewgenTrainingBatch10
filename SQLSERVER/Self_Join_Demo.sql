select * from Salesperson 

--SalespersonId, SalespersonName, DoJ, TeamLeaderName

select s2.SalespersonId, s2.SalespersonName,
s2.DateOfJoining, s1.SalespersonName as [Team Leader Name]
from Salesperson s1 right join Salesperson s2
on s2.TeamLeaderCode = s1.SalespersonId



create function dbo.fx_findTeamSize(@SalespersonId int)
returns int
begin
  declare @TeamSize int
  select @TeamSize = count(*) from Salesperson 
  where TeamLeaderCode = @SalespersonId
  return @TeamSize
end





select * from customer


select s2.SalespersonId, s2.SalespersonName,
dbo.fx_findTeamSize(s2.SalespersonId) as [Team Size],
s2.DateOfJoining, s1.SalespersonName as [Team Leader Name]
from Salesperson s1 right join Salesperson s2
on s2.TeamLeaderCode = s1.SalespersonId