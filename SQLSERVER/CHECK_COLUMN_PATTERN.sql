



CREATE TABLE [dbo].[Books](
	[BookId] [char](5) NOT NULL PRIMARY KEY,
	[BookName] [varchar](40) NOT NULL,
	[AuthorName] [varchar](40) NULL,
	[Price] [smallint] NULL,
	[Publish_Date] [smalldatetime] NULL,
	[Publisher_Name] [varchar](40) NOT NULL,
	[category] [varchar](25) NULL,
	[BookLanguage] [varchar](20) NULL,
) 
GO
--ADD A PATTERN
ALTER TABLE [dbo].[Books]  WITH CHECK ADD CHECK  (([BookId] like 'B[0-9][0-9][0-9][0-9]'))
GO

ALTER TABLE [dbo].[Books]  WITH CHECK ADD CHECK  (([Price]>(0)))
GO

--CREATE A TABLE BY SPECIFYING A PATTERN ON Column [Id]
CREATE TABLE Registration
(
[Id] char(5) PRIMARY KEY CHECK ([Id] Like 'R[A-Z][0-9][0-9][0-9]'),
[Name] varchar(50) NOT NULL
)

INSERT INTO Registration 
VALUES ('RA001','Harish')

SELECT * FROM Registration 