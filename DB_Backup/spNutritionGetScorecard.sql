SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[spNutritionScorecardGetFirst]    Script Date: 09/19/2012 23:48:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spNutritionScorecardGetFirst]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spNutritionScorecardGetFirst]
GO
-- =============================================
-- Author:		David Bowers
-- Create date: 09/15/2012
-- Description:	Baseline for personal summary
-- (scorecard)
-- =============================================
CREATE PROCEDURE spNutritionScorecardGetFirst  
	@USERID varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT *
	FROM [dbo].[tbl_PersonalSummary] 
	WHERE guidUserId = @USERID
	AND intPersonalSummaryId=(SELECT MIN(intPersonalSummaryId) FROM [dbo].[tbl_PersonalSummary] WHERE guidUserId = @USERID) 
	
END
GO
