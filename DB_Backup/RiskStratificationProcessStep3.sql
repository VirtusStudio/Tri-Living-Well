--Insert RiskStratificationProcessStep3TriIntroduction - Tri tab for CMS management
INSERT INTO [TLW].[dbo].[tbl_ContentPages]
           ([strPageName]
           ,[strDefaultName]
           ,[intTemplateType]
           ,[intModifiedBy]
           ,[TextAreaHTML]
           ,[dtModifedOn])
     VALUES
           ('RiskStratificationProcessStep3TriIntroduction'
           ,'RiskStratificationProcessStep3TriIntroduction'
           ,1
           ,1
            ,'Tri information Tab1'
           ,GETDATE())
           
           ----Insert RiskStratificationProcessStep3LivingIntroduction- Living tab for CMS management
           INSERT INTO [TLW].[dbo].[tbl_ContentPages]
           ([strPageName]
           ,[strDefaultName]
           ,[intTemplateType]
           ,[intModifiedBy]
           ,[TextAreaHTML]
           ,[dtModifedOn])
     VALUES
           ('RiskStratificationProcessStep3LivingIntroduction'
           ,'RiskStratificationProcessStep3LivingIntroduction'
           ,1
           ,1
            ,'Living information Tab1'
           ,GETDATE())
     
           ----Insert RiskStratificationProcessStep3WellIntroduction- Well tab for CMS management
           INSERT INTO [TLW].[dbo].[tbl_ContentPages]
           ([strPageName]
           ,[strDefaultName]
           ,[intTemplateType]
           ,[intModifiedBy]
           ,[TextAreaHTML]
           ,[dtModifedOn])
     VALUES
           ('RiskStratificationProcessStep3WellIntroduction'
           ,'RiskStratificationProcessStep3WellIntroduction'
           ,1
           ,1
            ,'Well information Tab1'
           ,GETDATE())






