/****** Object:  StoredProcedure [dbo].[spCaloricCalculator_GetUserData]    Script Date: 09/19/2012 23:48:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCaloricCalculator_GetUserData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spCaloricCalculator_GetUserData]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCaloricCalculator_GetUserData]
@USER_ID VARCHAR(100)
AS

--858b5769-15f9-462c-bf46-39031a46ef15 User_id cbono@bluegrotto.com

	SELECT PS.*  
	FROM tbl_PersonalSummary PS
	WHERE PS.guidUserId = @USER_ID
GO
