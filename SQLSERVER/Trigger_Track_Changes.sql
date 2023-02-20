Create Table Sample
(
SampleId int,
SampleDate date
)

Create Table ChangeTracking
(
SampleId int,
ChangedOn date,
OldDateValue date,
NewDateValue date
)

INSERT INTO Sample
VALUES (1, '2023-01-01'), (2, '2023-01-02')



CREATE trigger [dbo].[trg_TrackDateChange]
on [dbo].[sample]
for update
as
begin
   declare @olddate date
   declare @newdate date
   declare @sampleid int

   if update(sampledate)
   begin
      select @olddate = sampledate from deleted
	  select @newdate = sampledate from inserted
	  select @sampleid = sampleid from deleted
	  
	  if(@olddate <> @newdate)
	  insert into changetracking 
	  values (@sampleid,getdate(),@olddate,@newdate)
   end
end
GO


Update Sample
SET SampleDate = '2023-01-08'


SELECT * FROM ChangeTracking 
