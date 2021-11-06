/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Store_ID]
      ,[Status_Name]
      ,[Status_Desc]
      ,[Is_Active]
      ,[Status_Assigned]
  FROM [sql tutorial].[dbo].[StoreStatus]