using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;

namespace BLL
{
    public class TemplateLib
    {

        #region Binding Functions

        /// Function Header*******************************************************
        /// Function Name: GetCompanyDetailsById
        /// Function Type: Function
        /// Functionality: used to get the details of company by companyid
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.TemplateInfo> GetTemplateByTemplateType(int _intTemplateTypeId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _t in _db.ContentPages
                                  where _t.intTemplateType.Equals(_intTemplateTypeId)
                                  select new Entity.TemplateInfo()
                                  {
                                      StrPageName = _t.strPageName,
                                      StrDefaultName = _t.strDefaultName
                                  }).ToList();
                return _varRetVal;
            }
        }



        /// Function Header*******************************************************
        /// Function Name: GetCompanyDetailsById
        /// Function Type: Function
        /// Functionality: used to get the details of company by companyid
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public Entity.TemplateInfo GetTemplateDetailsByTemplateTemplateName(string _strTemplateName)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _t in _db.ContentPages
                                  where _t.strPageName.Equals(_strTemplateName)
                                  select new Entity.TemplateInfo()
                                  {
                                      StrPageName = _t.strPageName,
                                      StrDefaultName = _t.strDefaultName,
                                      TextAreaHTML = _t.TextAreaHTML
                                  }).FirstOrDefault();
                return _varRetVal;
            }
        }


        /// Function Header*******************************************************
        /// Function Name: UpdateTemplateDetails
        /// Function Type: Function
        /// Functionality: used to update the details
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void UpdateTemplateDetails(string _strTemplateName, string _strHTMLText)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {

                var _varTemplate = _db.ContentPages.Where(x => x.strPageName.Equals(_strTemplateName)).FirstOrDefault();
                if (_varTemplate != null)
                {
                    _varTemplate.TextAreaHTML = _strHTMLText;
                    _varTemplate.dtModifedOn = DateTime.Now;
                    _db.SubmitChanges();
                }
            }
        }

        #endregion

    }

    public class HotSectionDetailsLib
    {
        #region Insert Functions

        /// Function Header*******************************************************
        /// Function Name: SaveHotSectionDetails
        /// Function Type: Function
        /// Functionality: used to save the details  
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int SaveHotSectionDetails(Entity.HotSectionDetailsInfo oHotSectionDetailsInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 0;

                var _varChkDuplicate = _db.HotSectionDetails.Where(x => x.strHeading.ToLower().
                            Equals(oHotSectionDetailsInfo.StrHeading.ToLower())).FirstOrDefault();
                bool blnIsRecordExists = false;
                if (_varChkDuplicate != null)
                {
                    blnIsRecordExists = true;
                }

                if (!blnIsRecordExists)
                {
                    DAL.HotSectionDetail oHotSectionDetailDBML = new HotSectionDetail();

                    oHotSectionDetailDBML.strHeading = oHotSectionDetailsInfo.StrHeading;
                    oHotSectionDetailDBML.strDescription = oHotSectionDetailsInfo.StrDescription;
                    oHotSectionDetailDBML.dtCreatedOn = oHotSectionDetailsInfo.DtCreatedOn;
                    oHotSectionDetailDBML.strLink = oHotSectionDetailsInfo.StrLink;
                    oHotSectionDetailDBML.chrIsDeleted = oHotSectionDetailsInfo.ChrIsDeleted;
                    oHotSectionDetailDBML.chrDisplayOnDashboard = oHotSectionDetailsInfo.ChrDisplayOnDashboard;
                    oHotSectionDetailDBML.guidUserId = oHotSectionDetailsInfo.GuidUserId;
                    _db.HotSectionDetails.InsertOnSubmit(oHotSectionDetailDBML);
                    _db.SubmitChanges();

                    intRetVal = oHotSectionDetailDBML.intHotSectionId;
                    oHotSectionDetailDBML = null;

                }


                oHotSectionDetailsInfo = null;
                return intRetVal;
            }
        }

        #endregion

        #region Update Functions

        /// Function Header*******************************************************
        /// Function Name: SaveHotSectionDetails
        /// Function Type: Function
        /// Functionality: used to save the details  
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int UpdateHotSectionDetails(Entity.HotSectionDetailsInfo oHotSectionDetailsInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 0;

                var _varHotSectionsDupCheck = _db.HotSectionDetails.Where(x => x.strHeading.ToLower().Equals(oHotSectionDetailsInfo.StrHeading.ToLower())).FirstOrDefault();
                if (_varHotSectionsDupCheck != null)
                {
                    intRetVal = 0;
                }
                else
                {
                    var _varHotSections = _db.HotSectionDetails.Where(x => x.intHotSectionId.Equals(oHotSectionDetailsInfo.IntHotSectionId)).SingleOrDefault();
                    _varHotSections.strHeading = oHotSectionDetailsInfo.StrHeading;
                    _varHotSections.strDescription = oHotSectionDetailsInfo.StrDescription;
                    _db.SubmitChanges();

                    intRetVal = oHotSectionDetailsInfo.IntHotSectionId;

                    _varHotSections = null;
                    oHotSectionDetailsInfo = null;
                }


                return intRetVal;
            }
        }

        /// Function Header*******************************************************
        /// Function Name: SaveHotSectionDetails
        /// Function Type: Function
        /// Functionality: used to save the details  
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void DeleteHotSectionDetails(int _intHotSectionDetailsId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varHotSections = _db.HotSectionDetails.Where(x => x.intHotSectionId.Equals(_intHotSectionDetailsId)).SingleOrDefault();
                _varHotSections.chrIsDeleted = 'Y';
                _varHotSections.dtDeletedOn = DateTime.Now;
                _db.SubmitChanges();

                _varHotSections = null;
            }
        }
        #endregion

        #region Binding Functions

        /// Function Header*******************************************************
        /// Function Name: GetAllHotSectionsByUserId
        /// Function Type: Function
        /// Functionality: used to get the details  
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.HotSectionDetailsInfo> GetAllHotSectionsByUserId(Guid _guidUserId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {

                var _varRetResult = (from _hs in _db.HotSectionDetails
                                     where _hs.guidUserId.Equals(_guidUserId)
                                     && _hs.chrIsDeleted.Equals('N')
                                     select new Entity.HotSectionDetailsInfo
                                     {
                                         IntHotSectionId = _hs.intHotSectionId,
                                         StrHeading = _hs.strHeading,
                                         StrDescription = _hs.strDescription,
                                         DtCreatedOn = _hs.dtCreatedOn,
                                         StrLink = _hs.strLink ?? string.Empty,
                                         ChrIsDeleted = _hs.chrIsDeleted,
                                         GuidUserId = _hs.guidUserId
                                     }).ToList();

                return _varRetResult;
            }



        }

        /// Function Header*******************************************************
        /// Function Name: GetAllHotSectionsByUserId
        /// Function Type: Function
        /// Functionality: used to get the details  
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.HotSectionDetailsInfo> GetAllHotSections()
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {

                var _varRetResult = (from _hs in _db.HotSectionDetails
                                     where _hs.chrIsDeleted.Equals('N')
                                     select new Entity.HotSectionDetailsInfo
                                     {
                                         IntHotSectionId = _hs.intHotSectionId,
                                         StrHeading = _hs.strHeading,
                                         StrDescription = _hs.strDescription,
                                         DtCreatedOn = _hs.dtCreatedOn,
                                         StrLink = _hs.strLink ?? string.Empty,
                                         ChrIsDeleted = _hs.chrIsDeleted,
                                         GuidUserId = _hs.guidUserId
                                     }).ToList();

                return _varRetResult;
            }



        }




        /// Function Header*******************************************************
        /// Function Name: GetAllHotSectionsByPrimaryId
        /// Function Type: Function
        /// Functionality: used to get the details  
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public Entity.HotSectionDetailsInfo GetAllHotSectionsByPrimaryId(int _intHotSectionId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetResult = (from _hs in _db.HotSectionDetails
                                     where _hs.intHotSectionId.Equals(_intHotSectionId)
                                     && _hs.chrIsDeleted.Equals('N')
                                     select new Entity.HotSectionDetailsInfo
                                     {
                                         IntHotSectionId = _hs.intHotSectionId,
                                         StrHeading = _hs.strHeading,
                                         StrDescription = _hs.strDescription,
                                         DtCreatedOn = _hs.dtCreatedOn,
                                         StrLink = _hs.strLink ?? string.Empty,
                                         ChrIsDeleted = _hs.chrIsDeleted,
                                         GuidUserId = _hs.guidUserId
                                     }).SingleOrDefault();

                return _varRetResult;
            }
        }

        #endregion
    }

    public class PersonalSummaryLib
    {
        #region Insert Functions

        /// Function Header*******************************************************
        /// Function Name: SavePersonalSummaryDetails
        /// Function Type: Function
        /// Functionality: used to save the details  
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void SavePersonalSummaryDetails(Entity.PersonalSummaryInfo oPersonalSummaryInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {

                var _varExistingPersonalSummary = _db.PersonalSummaries.Where(x => x.guidUserId.Equals
                    (oPersonalSummaryInfo.GuidUserId)).FirstOrDefault();
                if (_varExistingPersonalSummary != null)
                {
                    _varExistingPersonalSummary.decBMI = oPersonalSummaryInfo.DecBMI;
                    _varExistingPersonalSummary.decBodyFATPercentage = oPersonalSummaryInfo.DecBodyFATPercentage;
                    _varExistingPersonalSummary.decWaist = oPersonalSummaryInfo.DecWaist;
                    _varExistingPersonalSummary.decWaistToHeight = oPersonalSummaryInfo.DecWaistToHeight;
                    _varExistingPersonalSummary.decWaistToHip = oPersonalSummaryInfo.DecWaistToHip;
                    _varExistingPersonalSummary.decWeight = oPersonalSummaryInfo.DecWeight;
                    _varExistingPersonalSummary.dtModifiedOn = oPersonalSummaryInfo.DtCreatedOn;

                    _db.SubmitChanges();
                    _varExistingPersonalSummary = null;

                }
                else
                {
                    DAL.PersonalSummary oPersonalSummaryDAL = new PersonalSummary();
                    oPersonalSummaryDAL.decBMI = oPersonalSummaryInfo.DecBMI;
                    oPersonalSummaryDAL.decBodyFATPercentage = oPersonalSummaryInfo.DecBodyFATPercentage;
                    oPersonalSummaryDAL.decWaist = oPersonalSummaryInfo.DecWaist;
                    oPersonalSummaryDAL.decWaistToHeight = oPersonalSummaryInfo.DecWaistToHeight;
                    oPersonalSummaryDAL.decWaistToHip = oPersonalSummaryInfo.DecWaistToHip;
                    oPersonalSummaryDAL.decWeight = oPersonalSummaryInfo.DecWeight;
                    oPersonalSummaryDAL.dtModifiedOn = oPersonalSummaryInfo.DtCreatedOn;
                    oPersonalSummaryDAL.guidUserId = oPersonalSummaryInfo.GuidUserId;
                    oPersonalSummaryDAL.dtCreatedOn = oPersonalSummaryDAL.dtCreatedOn;
                    _db.PersonalSummaries.InsertOnSubmit(oPersonalSummaryDAL);
                    _db.SubmitChanges();

                    oPersonalSummaryDAL = null;
                }

            }
        }

        #endregion

        #region Binding Functions

        /// Function Header*******************************************************
        /// Function Name: GetPersonalSummaryDetailsByUserId
        /// Function Type: Function
        /// Functionality: used to get the details by userid  
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public Entity.PersonalSummaryInfo GetPersonalSummaryDetailsByUserId(Guid _guidUserId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {

                return (from _ps in _db.PersonalSummaries
                        where _ps.guidUserId.Equals(_guidUserId)
                        select new Entity.PersonalSummaryInfo
                        {
                            DecBMI = _ps.decBMI ?? 0,
                            DecBodyFATPercentage = _ps.decBodyFATPercentage ?? 0,
                            DecWaist = _ps.decWaist ?? 0,
                            DecWaistToHeight = _ps.decWaistToHeight ?? 0,
                            DecWaistToHip = _ps.decWaistToHip ?? 0,
                            DecWeight = _ps.decWeight ?? 0,
                            DtCreatedOn = _ps.dtCreatedOn ?? DateTime.Now,
                            DtModifiedOn = _ps.dtModifiedOn ?? DateTime.Now,
                        }).SingleOrDefault();

            }
        }


        /// Function Header*******************************************************
        /// Function Name: GetTLWFormulaForIndividualReport
        /// Function Type: Function
        /// Functionality: used to get the details by userid  
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.PersonalSummaryInfo> GetTLWFormulaForIndividualReport(Entity.PersonalSummaryInfo oPersonalSummaryInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {

                return (from _ps in _db.ms_GetTLWFormulaForIndividualReport(oPersonalSummaryInfo.StrGender,
                                                                            oPersonalSummaryInfo.DecWaist,
                                                                            oPersonalSummaryInfo.DecBMI,
                                                                            oPersonalSummaryInfo.DecBodyFATPercentage,
                                                                            oPersonalSummaryInfo.DecWaistToHeight,
                                                                            oPersonalSummaryInfo.DecWaistToHip,
                                                                            oPersonalSummaryInfo.DecWeight)
                        select new Entity.PersonalSummaryInfo
                        {
                            StrRatioType = _ps.strRatioType,
                            StrRatioCode = _ps.strRatioCode,
                            DecFrom = _ps.decFrom ?? 0,
                            DecTo = _ps.decTo ?? 0,
                            StrLevelofRisk = _ps.strLevelofRisk ?? "",
                            DtModifiedOn = _ps.dtModifiedOn ?? DateTime.Now
                        }).ToList();

            }
        }



        #endregion
    }
}
