if exists( select * from  sysobjects where name = 'Spider_IP' and type = 'U')
	drop table Spider_IP;
create table Spider_IP(
	FID int IDENTITY(1,1) not null,
	FIP VARCHAR(64) null,
	FPort varchar(32) null,
	FCountry varchar(32) null,
	FProxyType VARCHAR(32) null,
	FLastTestTime varchar(64) null,
	FStatus int not null,
	FAddtime datetime not null,
	FModifytime datetime null
 CONSTRAINT [PK_Spider_IP] PRIMARY KEY CLUSTERED
(
	FID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_IP', @level2type=N'COLUMN',@level2name=N'FID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_IP', @level2type=N'COLUMN',@level2name=N'FIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'端口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_IP', @level2type=N'COLUMN',@level2name=N'FPort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'国家' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_IP', @level2type=N'COLUMN',@level2name=N'FCountry'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_IP', @level2type=N'COLUMN',@level2name=N'FProxyType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后测试时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_IP', @level2type=N'COLUMN',@level2name=N'FLastTestTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_IP', @level2type=N'COLUMN',@level2name=N'FStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_IP', @level2type=N'COLUMN',@level2name=N'FAddtime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_IP', @level2type=N'COLUMN',@level2name=N'FModifytime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ip来源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_IP'
GO