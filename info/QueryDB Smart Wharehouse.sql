--get thông tin về thùng
select * from FTT2021..t347 where mesoyear = 1476

--lấy thông tin về kho
SELECT * FROM FTT2021..t335
WHERE mesoyear = 1476 
    and c000 BETWEEN 28 and 347

-- select * from t083 where mesoyear = 1476

--Store get tat ca cac thung co trong rack
--bang t083 trong DOGE_WH
DECLARE @rack NVARCHAR(10)='28'
DROP TABLE IF EXISTS dbo.#temp1

;WITH 
    cteT347 as(
        SELECT * FROM FTT2021..t335
        WHERE mesoyear = 1476 
            and c000 BETWEEN 28 and 347
    ),
    cteT083 as (
        SELECT _t083.*
        FROM [DOGE_WH].[dbo].[T083] _t083
        WHERE _t083.c007 LIKE '%LMP%'
            and _t083.PostingTime is not NULL
            and _t083.c001 not like 'TTTTT%'
            -- and _t083.WHFrom = @rack
            --and _t083.OCNum = 'IO04177' and _t083.BoxCode='63/1002'
    )

SELECT _c083.*
INTO #temp1 
FROM cteT083 _c083

SELECT * FROM #temp1