if exists( select * from  sysobjects where name = 'Spider_Video_Site' and type = 'U')
	drop table Spider_Video_Site;
create table Spider_Video_Site(
	FID int not null,
	FSiteName VARCHAR(64) null,
	FIPCheckUrl VARCHAR(512) null,
	FIsNeedCheck BIT not NULL,
	FAddtime datetime not null,
	FModifytime datetime null
 CONSTRAINT [PK_Spider_Video_Site] PRIMARY KEY CLUSTERED
(
	FID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站点ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Video_Site', @level2type=N'COLUMN',@level2name=N'FID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站点名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Video_Site', @level2type=N'COLUMN',@level2name=N'FSiteName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IP检验地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Video_Site', @level2type=N'COLUMN',@level2name=N'FIPCheckUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否需要校验' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Video_Site', @level2type=N'COLUMN',@level2name=N'FIsNeedCheck'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Video_Site', @level2type=N'COLUMN',@level2name=N'FAddtime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Video_Site', @level2type=N'COLUMN',@level2name=N'FModifytime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频来源站点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Video_Site'
GO


INSERT INTO Spider_Video_Site(FID,FSiteName,FIPCheckUrl,FIsNeedCheck,FAddTime,FModifyTime) VALUES(1,'百度','HTTPS://www.baidu.com/',1,GETDATE(),GETDATE());