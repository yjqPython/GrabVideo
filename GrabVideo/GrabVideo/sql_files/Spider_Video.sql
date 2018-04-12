if exists( select * from  sysobjects where name = 'Spider_Video' and type = 'U')
	drop table Spider_Video;
create table Spider_Video(
	FID int IDENTITY(1,1) not null,
	FFromSiteID int not null,
	FVideoKey varchar(128) null,
	FVideoTitle VARCHAR(512) null,
	FVideoImgurl varchar(512) null,
	FVideoPageLink varchar(512) null,
	FVideoUrl varchar(512) null,
	FVideoDuration NUMERIC(18,2) null,
	FAddtime datetime not null,
	FModifytime datetime NULL
 CONSTRAINT [PK_Spider_Video] PRIMARY KEY CLUSTERED
(
	FID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Video', @level2type=N'COLUMN',@level2name=N'FID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来源站点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Video', @level2type=N'COLUMN',@level2name=N'FFromSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Video', @level2type=N'COLUMN',@level2name=N'FVideoKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Video', @level2type=N'COLUMN',@level2name=N'FVideoTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Video', @level2type=N'COLUMN',@level2name=N'FVideoImgurl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'页面链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Video', @level2type=N'COLUMN',@level2name=N'FVideoPageLink'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Video', @level2type=N'COLUMN',@level2name=N'FVideoUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时长' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Video', @level2type=N'COLUMN',@level2name=N'FVideoDuration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Video', @level2type=N'COLUMN',@level2name=N'FAddtime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Video', @level2type=N'COLUMN',@level2name=N'FModifytime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spider_Video'
GO