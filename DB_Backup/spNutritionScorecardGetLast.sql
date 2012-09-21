USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionScorecardGetLast]    Script Date: 09/20/2012 04:35:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutritionScorecardGetLast]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutritionScorecardGetLast]
GO

USE [TLW]
GO

/****** Object:  StoredProcedure [dbo].[spNutritionScorecardGetLast]    Script Date: 09/20/2012 04:35:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		David Bowers
-- Create date: 09/15/2012
-- Description:	Latest for personal summary
-- (scorecard)
-- =============================================
CREATE PROCEDURE [dbo].[spNutritionScorecardGetLast]  
	@USERID varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT *
	FROM [dbo].[tbl_PersonalSummary] 
	WHERE guidUserId = @USERID
	AND intPersonalSummaryId=(SELECT MAX(intPersonalSummaryId) FROM [dbo].[tbl_PersonalSummary] WHERE guidUserId = @USERID) 
	
END

GO


