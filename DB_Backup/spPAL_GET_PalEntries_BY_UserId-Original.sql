USE [TLW_FMS]
GO
/****** Object:  StoredProcedure [dbo].[spPAL_GET_PalEntries_BY_UserId]    Script Date: 04/21/2012 11:12:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spPAL_GET_PalEntries_BY_UserId]
@USER_ID VARCHAR(100),
@DATE_FROM VARCHAR(100),
@DATE_TO VARCHAR(100)
AS

--858b5769-15f9-462c-bf46-39031a46ef15 User_id cbono@bluegrotto.com


if(@DATE_FROM = '' or @DATE_TO = '')
begin
	SELECT PE.*, PME.MET_EQUIVALENT,
		PAL_ENTRY_TYPE_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_TYPE and LIST_NAME='Type'),
		PAL_ENTRY_TIME_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_TIME and LIST_NAME='Time'),
		PAL_ENTRY_INTENSITY_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_INTENSITY and LIST_NAME='Intensity'),
		PAL_ENTRY_DURATION_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_DURATION and LIST_NAME='Duration')
	FROM PAL_ENTRIES PE 
	INNER JOIN PAL_MET_EQUIVALENT PME ON
			PME.ACTIVITY_ID = PE.PAL_ENTRY_TYPE AND
			PME.DURATION = PE.PAL_ENTRY_DURATION AND
			PME.INTENSITY = PE.PAL_ENTRY_INTENSITY
	WHERE PE.DELETE_FLG=0 
		AND	PE.USER_ID=@USER_ID
	ORDER BY PE.PAL_ENTRY_DATE DESC
end
else
begin
	SELECT PE.*, PME.MET_EQUIVALENT,
		PAL_ENTRY_TYPE_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_TYPE and LIST_NAME='Type'),
		PAL_ENTRY_TIME_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_TIME and LIST_NAME='Time'),
		PAL_ENTRY_INTENSITY_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_INTENSITY and LIST_NAME='Intensity'),
		PAL_ENTRY_DURATION_TEXT=(select ITEM_TEXT from LIST_PAL WHERE ITEM_ID=PE.PAL_ENTRY_DURATION and LIST_NAME='Duration')
	FROM PAL_ENTRIES PE 
	INNER JOIN PAL_MET_EQUIVALENT PME ON
			PME.ACTIVITY_ID = PE.PAL_ENTRY_TYPE AND
			PME.DURATION = PE.PAL_ENTRY_DURATION AND
			PME.INTENSITY = PE.PAL_ENTRY_INTENSITY
	WHERE PE.DELETE_FLG=0  
		AND PE.USER_ID=@USER_ID  
		AND (PE.PAL_ENTRY_DATE between @DATE_FROM and @DATE_TO)
	ORDER BY PE.PAL_ENTRY_DATE DESC
end