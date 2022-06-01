USE [geodata]
GO


/*
DEPTH_FROM	DEPTH_TO	INTERVAL_TYPE	LITH	LITH_PCT
4.130		9.140		О				6c		80
4.130		9.140		В				3b		10
4.130		9.140		В				2i		10
*/

-- Author: Maxim Mingalov
-- Create date: 05 Apr 2021
-- Description:	Returns the intervals "О", "В" with detailed lithology description. These Intervals equal to interval from GeologyDescription
-- for a given PROJECT, SITE_ID and INTERVAL of GeologyDescription
-- Usage: SELECT [dbo].[ufnGB_NG_GetLithologyDescription](N'East','0672',2,4.13)

alter FUNCTION [dbo].[ufnGB_NG_GetLithologyDescription]
(
@Project NVARCHAR(16)
,@Site_ID NVARCHAR(16)
,@Depth_from decimal(8,3)
,@Depth_to decimal(8,3)
--,@Interval_type nvarchar(8)
)
RETURNS NVARCHAR(4000) 
  
AS

BEGIN

DECLARE @DESCR NVARCHAR(4000) = ''
DECLARE @I INT = 1

DECLARE @returntable TABLE (
  NUM INT
  ,PROJECT NVARCHAR(16)
  ,SITE_ID NVARCHAR(16)
  ,DEPTH_FROM decimal(8,3)
  ,DEPTH_TO decimal(8,3)
  ,INTERVAL_TYPE nvarchar(8)
  ,DESCR NVARCHAR(MAX) 
  )

;with 
	O as (SELECT 
				PROJECT,
				SITE_ID,
				DEPTH_FROM,
				DEPTH_TO,
				INTERVAL_TYPE,
				N'Главная порода: ' + dbo.ufnGB_NG_GetCodeDescription(N'I', N'v_lit_rockname', LITH) + ' (' + cast(LITH_PCT as nvarchar) + '%)'
				+ISNULL (N' ' + dbo.ufnGB_NG_GetCodeDescription(N'R', N'v_lit_colour', COLOUR) + N' цвета',N'')
				+ISNULL (N', структура ' + dbo.ufnGB_NG_GetCodeDescription(N'I', N'v_lit_structure_type', STRUCTURE),N'')
				+ISNULL (N', текстура ' + dbo.ufnGB_NG_GetCodeDescription(N'I', N'v_lit_texture_type', TEXTURE),N'')
				--+'. '				
				+ISNULL(COMMENT,'')
			+ '.' DESCR
			FROM GB_LITHOLOGY
			where PROJECT = @project and SITE_ID = @site_id and DEPTH_FROM = @depth_from and DEPTH_TO = @depth_to and INTERVAL_TYPE = N'О'
			)
	,V as (SELECT 
			PROJECT,
			SITE_ID,
			DEPTH_FROM,
			DEPTH_TO,
			INTERVAL_TYPE,
			N'Второстепенная порода: ' + dbo.ufnGB_NG_GetCodeDescription(N'I', N'v_lit_rockname', LITH) + ' (' + cast(LITH_PCT as nvarchar) + '%)'
			+ISNULL (N' ' + dbo.ufnGB_NG_GetCodeDescription(N'R', N'v_lit_colour', COLOUR) + N' цвета',N'')
			+ISNULL (N', структура ' + dbo.ufnGB_NG_GetCodeDescription(N'I', N'v_lit_structure_type', STRUCTURE),N'')
			+ISNULL (N', текстура ' + dbo.ufnGB_NG_GetCodeDescription(N'I', N'v_lit_texture_type', TEXTURE),N'')
							
			+ISNULL(COMMENT,'')
		+ '.' DESCR
		FROM GB_LITHOLOGY
		where PROJECT = @Project and SITE_ID = @Site_ID and DEPTH_FROM = @Depth_from and DEPTH_TO = @Depth_to and INTERVAL_TYPE = N'В'
	)
,OV as (
	SELECT
			--ROW_NUMBER() OVER(ORDER BY DEPTH_FROM),
			PROJECT,
			SITE_ID,
			DEPTH_FROM,
			DEPTH_TO,
			INTERVAL_TYPE,
			DESCR
		FROM O
		union all
		SELECT
			--ROW_NUMBER() OVER(ORDER BY DEPTH_FROM),
			PROJECT,
			SITE_ID,
			DEPTH_FROM,
			DEPTH_TO,
			INTERVAL_TYPE,
			DESCR
		FROM V
		--ORDER BY INTERVAL_TYPE DESC
)
INSERT @returntable 	
	SELECT
			ROW_NUMBER() OVER(ORDER BY INTERVAL_TYPE DESC,DEPTH_FROM) INTERVAL_TYPE,
			PROJECT,
			SITE_ID,
			DEPTH_FROM,
			DEPTH_TO,
			INTERVAL_TYPE,
			DESCR
	FROM OV
	



IF EXISTS (SELECT * FROM @returntable)
		SET @DESCR = N''
	WHILE (@I <= (SELECT MAX(NUM) FROM @returntable))
		BEGIN
			SET @DESCR = @DESCR + (SELECT DESCR FROM @returntable WHERE NUM = @I) + N' '
			SET @I = @I + 1
		END;
	
	
	RETURN @DESCR
	END;
GO

SELECT 1,[dbo].[ufnGB_NG_GetLithologyDescription](N'East','test-001',0,10)
union
SELECT 2,[dbo].[ufnGB_NG_GetLithologyDescription](N'East','test-001',10,20)
union
SELECT 3,[dbo].[ufnGB_NG_GetLithologyDescription](N'East','test-001',20,30)

order by 1 asc

SELECT * FROM [geodata].[dbo].[GB_LITHOLOGY] where PROJECT = N'East' and SITE_ID = 'test-001'

