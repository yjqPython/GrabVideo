if exists( select * from  sysobjects where name = 'Spider_Site_IP' and type = 'U')
	drop table Spider_Site_IP;
create table Spider_Site_IP(
	FID int IDENTITY(1,1) not null,
	FSiteID int NOT null,
	FIPID int NOT null,
	FResponseTime NUMERIC(18,2) NOT null,
	FAddtime datetime not null,
	FModifytime datetime null
 CONSTRAINT [PK_Spider_Site_IP] PRIMARY KEY CLUSTERED
(
	FID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Site_IP', @level2type=N'COLUMN',@level2name=N'FID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站点ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Site_IP', @level2type=N'COLUMN',@level2name=N'FSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IPID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Site_IP', @level2type=N'COLUMN',@level2name=N'FIPID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'响应时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Site_IP', @level2type=N'COLUMN',@level2name=N'FResponseTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Site_IP', @level2type=N'COLUMN',@level2name=N'FAddtime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Site_IP', @level2type=N'COLUMN',@level2name=N'FModifytime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站点可使用IP表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Site_IP'
GO