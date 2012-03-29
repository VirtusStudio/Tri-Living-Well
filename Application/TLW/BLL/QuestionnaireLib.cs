using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
namespace BLL
{
    public class QuestionnaireLib
    {

        #region Insert Functions

        /// Function Header*******************************************************
        /// Function Name: SaveQuestionnaireDetails
        /// Function Type: Function
        /// Functionality: used to save the details of company
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int SaveQuestionnaireDetails(Entity.QuestionnaireInfo oQuestionnaireInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 1;
                var _varDup = _db.Questionnaires.Where(x => x.strQuestion.ToLower().Equals(oQuestionnaireInfo.StrQuestion.ToLower())
                                       && x.chrIsDeleted.Equals('N')
                                       && x.intQuestionnaireType.Equals(oQuestionnaireInfo.IntQuestionnaireType)
                                   ).SingleOrDefault();
                if (_varDup != null)
                {
                    intRetVal = -1;
                    oQuestionnaireInfo = null;
                    _varDup = null;
                }
                else
                {

                    DAL.Questionnaire oQuestionnaireDAL = new Questionnaire();
                    oQuestionnaireDAL.intQuestionnaireType = oQuestionnaireInfo.IntQuestionnaireType;
                    oQuestionnaireDAL.strQuestion = oQuestionnaireInfo.StrQuestion;
                    oQuestionnaireDAL.chrDisplayYes = oQuestionnaireInfo.ChrDisplayYes;
                    oQuestionnaireDAL.chrDisplayNo = oQuestionnaireInfo.ChrDisplayNo;
                    oQuestionnaireDAL.chrDisplayDontKnow = oQuestionnaireInfo.ChrDisplayDontKnow;

                    oQuestionnaireDAL.chrIsActive = oQuestionnaireInfo.ChrIsActive;
                    oQuestionnaireDAL.chrIsDeleted = oQuestionnaireInfo.ChrIsDeleted;
                    oQuestionnaireDAL.dtDeletedDate = oQuestionnaireInfo.DtCreatedDate;
                    oQuestionnaireDAL.dtCreatedDate = oQuestionnaireInfo.DtCreatedDate;
                    oQuestionnaireDAL.strQuestionHeading = oQuestionnaireInfo.StrQuestionHeading;
                    _db.Questionnaires.InsertOnSubmit(oQuestionnaireDAL);
                    _db.SubmitChanges();

                    intRetVal = oQuestionnaireDAL.intQuestionnaireId;
                    oQuestionnaireDAL = null;
                    oQuestionnaireInfo = null;
                }


                return intRetVal;
            }

        }


        /// Function Header*******************************************************
        /// Function Name: SaveUserRiskStratificationProcessDetails
        /// Function Type: Function
        /// Functionality: used to save the details of risk stratification process step 1 part A
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int SaveUserRiskStratificationProcessDetails(List<Entity.QuestionnaireInfo> oListQuestionnaireInfo, Guid _guidUserId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 1;

                var _varQuestion = _db.UserRiskStratificationDetails.Where(x => x.guidUserId.Equals(_guidUserId)
                                                                    && x.strStratificationStep.Equals("1A")
                                                                        ).ToList();
                if (_varQuestion != null)
                {
                    _db.UserRiskStratificationDetails.DeleteAllOnSubmit(_varQuestion);
                    _db.SubmitChanges();
                }

                List<DAL.UserRiskStratificationDetail> oListUserRiskStratificationDetailDAL = new List<DAL.UserRiskStratificationDetail>();

                foreach (var item in oListQuestionnaireInfo)
                {
                    DAL.UserRiskStratificationDetail oUserRiskStratificationDetail = new UserRiskStratificationDetail();
                    oUserRiskStratificationDetail.intQuestionnaireId = item.IntQuestionnaireId;
                    oUserRiskStratificationDetail.strQuestion = item.StrQuestion;
                    oUserRiskStratificationDetail.strAnswer = item.StrAnswer;
                    oUserRiskStratificationDetail.dtCreatedOn = item.DtCreatedDate;
                    oUserRiskStratificationDetail.guidUserId = _guidUserId;
                    oUserRiskStratificationDetail.strStratificationStep = "1A";
                    oListUserRiskStratificationDetailDAL.Add(oUserRiskStratificationDetail);
                    oUserRiskStratificationDetail = null;
                }

                _db.UserRiskStratificationDetails.InsertAllOnSubmit(oListUserRiskStratificationDetailDAL);
                _db.SubmitChanges();
                //UpdateUserStratificationStep
                UserLib oUserLib = new UserLib();
                oUserLib.UpdateUserStratificationStep(_guidUserId, "1A");
                oUserLib = null;

                oListUserRiskStratificationDetailDAL = null;
                oListQuestionnaireInfo = null;
                return intRetVal;
            }

        }


        /// Function Header*******************************************************
        /// Function Name: SaveUserRiskStratificationProcessDetails
        /// Function Type: Function
        /// Functionality: used to save the details of risk stratification process step 1 part A
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int SaveUserRiskStratificationProcessDetailsPartB(List<Entity.QuestionnaireInfo> oListQuestionnaireInfo, Guid _guidUserId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 1;

                var _varQuestion = _db.UserRiskStratificationDetails.Where(x => x.guidUserId.Equals(_guidUserId)
                                                                    && x.strStratificationStep.Equals("1B")
                                                                        ).ToList();
                if (_varQuestion != null)
                {
                    _db.UserRiskStratificationDetails.DeleteAllOnSubmit(_varQuestion);
                    _db.SubmitChanges();
                }

                List<DAL.UserRiskStratificationDetail> oListUserRiskStratificationDetailDAL = new List<DAL.UserRiskStratificationDetail>();

                foreach (var item in oListQuestionnaireInfo)
                {
                    DAL.UserRiskStratificationDetail oUserRiskStratificationDetail = new UserRiskStratificationDetail();
                    oUserRiskStratificationDetail.intQuestionnaireId = item.IntQuestionnaireId;
                    oUserRiskStratificationDetail.strQuestion = item.StrQuestion;
                    oUserRiskStratificationDetail.strAnswer = item.StrAnswer;
                    oUserRiskStratificationDetail.dtCreatedOn = item.DtCreatedDate;
                    oUserRiskStratificationDetail.guidUserId = _guidUserId;
                    oUserRiskStratificationDetail.strStratificationStep = "1B";
                    oListUserRiskStratificationDetailDAL.Add(oUserRiskStratificationDetail);
                    oUserRiskStratificationDetail = null;
                }

                _db.UserRiskStratificationDetails.InsertAllOnSubmit(oListUserRiskStratificationDetailDAL);
                _db.SubmitChanges();
                UserLib oUserLib = new UserLib();
                oUserLib.UpdateUserStratificationStep(_guidUserId, "1B");
                oUserLib = null;

                oListUserRiskStratificationDetailDAL = null;
                oListQuestionnaireInfo = null;
                return intRetVal;
            }

        }

        /// Function Header*******************************************************
        /// Function Name: SaveUserRiskStratificationProcessDetails
        /// Function Type: Function
        /// Functionality: used to save the details of risk stratification process step 1 part A
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int SaveUserRiskStratificationProcessDetailsStepSecond(List<Entity.QuestionnaireInfo> oListQuestionnaireInfo, Guid _guidUserId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 1;

                var _varQuestion = _db.UserRiskStratificationDetails.Where(x => x.guidUserId.Equals(_guidUserId)
                                                                    && x.strStratificationStep.Equals("2")
                                                                        ).ToList();
                if (_varQuestion != null)
                {
                    _db.UserRiskStratificationDetails.DeleteAllOnSubmit(_varQuestion);
                    _db.SubmitChanges();
                }

                List<DAL.UserRiskStratificationDetail> oListUserRiskStratificationDetailDAL = new List<DAL.UserRiskStratificationDetail>();

                foreach (var item in oListQuestionnaireInfo)
                {
                    DAL.UserRiskStratificationDetail oUserRiskStratificationDetail = new UserRiskStratificationDetail();
                    oUserRiskStratificationDetail.intQuestionnaireId = item.IntQuestionnaireId;
                    oUserRiskStratificationDetail.strQuestion = item.StrQuestion;
                    oUserRiskStratificationDetail.strAnswer = item.StrAnswer;
                    oUserRiskStratificationDetail.dtCreatedOn = item.DtCreatedDate;
                    oUserRiskStratificationDetail.guidUserId = _guidUserId;
                    oUserRiskStratificationDetail.strStratificationStep = "2";
                    oListUserRiskStratificationDetailDAL.Add(oUserRiskStratificationDetail);
                    oUserRiskStratificationDetail = null;
                }

                _db.UserRiskStratificationDetails.InsertAllOnSubmit(oListUserRiskStratificationDetailDAL);
                _db.SubmitChanges();
                UserLib oUserLib = new UserLib();
                oUserLib.UpdateUserStratificationStep(_guidUserId, "2");
                oUserLib = null;

                oListUserRiskStratificationDetailDAL = null;
                oListQuestionnaireInfo = null;
                return intRetVal;
            }

        }

        #endregion

        #region Update Functions

        /// Function Header*******************************************************
        /// Function Name: UpdateQuestionnaireDetails
        /// Function Type: Function
        /// Functionality: used to update the details 
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int UpdateQuestionnaireDetails(Entity.QuestionnaireInfo oQuestionnaireInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 1;

                var _varDup = _db.Questionnaires.Where(x => x.strQuestion.ToLower().Equals(oQuestionnaireInfo.StrQuestion.ToLower())
                                     && x.chrIsDeleted.Equals('N')
                                     && x.intQuestionnaireType.Equals(oQuestionnaireInfo.IntQuestionnaireType)
                                     && !x.intQuestionnaireId.Equals(oQuestionnaireInfo.IntQuestionnaireId)
                                 ).SingleOrDefault();

                if (_varDup != null)
                {
                    return -1;
                }


                var oQuestionnaireDAL = _db.Questionnaires.Where(x => x.intQuestionnaireId.Equals(oQuestionnaireInfo.IntQuestionnaireId)
                                   ).SingleOrDefault();
                if (oQuestionnaireDAL != null)
                {
                    oQuestionnaireDAL.intQuestionnaireType = oQuestionnaireInfo.IntQuestionnaireType;
                    oQuestionnaireDAL.strQuestion = oQuestionnaireInfo.StrQuestion;
                    oQuestionnaireDAL.chrDisplayYes = oQuestionnaireInfo.ChrDisplayYes;
                    oQuestionnaireDAL.chrDisplayNo = oQuestionnaireInfo.ChrDisplayNo;
                    oQuestionnaireDAL.chrDisplayDontKnow = oQuestionnaireInfo.ChrDisplayDontKnow;
                    oQuestionnaireDAL.chrIsActive = oQuestionnaireInfo.ChrIsActive;
                    oQuestionnaireDAL.dtModifiedDate = oQuestionnaireInfo.DtCreatedDate;
                    oQuestionnaireDAL.strQuestionHeading = oQuestionnaireInfo.StrQuestionHeading;

                    _db.SubmitChanges();

                    intRetVal = oQuestionnaireDAL.intQuestionnaireId;
                    oQuestionnaireDAL = null;
                    oQuestionnaireInfo = null;
                }

                return intRetVal;
            }

        }

        /// Function Header*******************************************************
        /// Function Name: UpdateQuestionnaireDetails
        /// Function Type: Function
        /// Functionality: used to update the details 
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void DeleteQuestionnaireDetails(int _intQuestionnareId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var oQuestionnaireDAL = _db.Questionnaires.Where(x => x.intQuestionnaireId.Equals(_intQuestionnareId)
                                   ).SingleOrDefault();
                if (oQuestionnaireDAL != null)
                {
                    oQuestionnaireDAL.chrIsDeleted = 'Y';
                    oQuestionnaireDAL.dtDeletedDate = DateTime.Now;
                    _db.SubmitChanges();
                    oQuestionnaireDAL = null;
                }
            }
        }

        /// Function Header*******************************************************
        /// Function Name: UpdateQuestionnaireDetails
        /// Function Type: Function
        /// Functionality: used to update the details 
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void ChangeStatusofQuestionnaire(int _intQuestionnareId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var oQuestionnaireDAL = _db.Questionnaires.Where(x => x.intQuestionnaireId.Equals(_intQuestionnareId)
                                   ).SingleOrDefault();
                if (oQuestionnaireDAL != null)
                {
                    oQuestionnaireDAL.chrIsActive = oQuestionnaireDAL.chrIsActive.Equals('Y') ? 'N' : 'Y';
                    oQuestionnaireDAL.dtModifiedDate = DateTime.Now;
                    _db.SubmitChanges();
                    oQuestionnaireDAL = null;
                }
            }
        }


        /// Function Header*******************************************************
        /// Function Name: UpdateGlobalCodesByGlobalCodeId
        /// Function Type: Function
        /// Functionality: used to update the global code details 
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public bool UpdateGlobalCodesByGlobalCodeId(string _strValue, int _intGlobalCodeId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                try
                {
                    var _varGlobalCode = (from _q in _db.GlobalCodes
                                          where _q.chrisActive.Equals('Y')
                                          && _q.intGlobalCodesId.Equals(_intGlobalCodeId)
                                          select _q).SingleOrDefault();

                    _varGlobalCode.strValue = _strValue;
                    _db.SubmitChanges();

                    return true;
                }
                catch { return false; }
            }
        }



        #endregion

        #region Bind Functions

        /// Function Header*******************************************************
        /// Function Name: GetAllQuestionnaires
        /// Function Type: Function
        /// Functionality: used to update the details 
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.QuestionnaireInfo> GetAllQuestionnaires()
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                return (from _q in _db.Questionnaires
                        where _q.chrIsDeleted.Equals('N')
                        select new Entity.QuestionnaireInfo()
                        {
                            StrQuestion = _q.strQuestion,
                            IntQuestionnaireId = _q.intQuestionnaireId,
                            ChrDisplayYes = _q.chrDisplayYes,
                            ChrDisplayNo = _q.chrDisplayNo,
                            ChrDisplayDontKnow = _q.chrDisplayDontKnow,
                            ChrIsActive = _q.chrIsActive,
                            IntQuestionnaireType = _q.intQuestionnaireType,
                            DtCreatedDate = _q.dtCreatedDate,
                            StrQuestionHeading = _q.strQuestionHeading
                        }).ToList();
            }
        }

        /// Function Header*******************************************************
        /// Function Name: IsUserGivenYesAnswerinFirstRiskStratificationStep
        /// Function Type: Function
        /// Functionality: used to check whether user had given yes answer in the risk stratification process step 1
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public bool HasUserGivenYesAnswerinFirstRiskStratificationStep(string _strUserEmailId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varListUserId = _db.aspnet_Users.Where(x => x.LoweredUserName.ToLower().Equals(_strUserEmailId.ToLower()
                    )).ToList();

                if (_varListUserId != null && _varListUserId.Count > 0)
                {
                    var _varQuestion = _db.UserRiskStratificationDetails.Where(x => x.guidUserId.Equals(_varListUserId.ElementAt(0).UserId)
                                                                            && x.strAnswer.ToLower().Equals("yes")
                                                                            && (x.strStratificationStep.Equals("1A") ||
                                                                            x.strStratificationStep.Equals("1B"))
                                                                            ).ToList();
                    if (_varQuestion != null && _varQuestion.Count > 0)
                        return true;
                    else
                        return false;
                }
                else
                    return false;

            }
        }



        /// Function Header*******************************************************
        /// Function Name: GetAllQuestionnaires
        /// Function Type: Function
        /// Functionality: used to update the details 
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.QuestionnaireInfo> GetAllQuestionnairesByQuestionnareType(int _intQuestionnaireTypeId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                if (_intQuestionnaireTypeId.Equals(3))
                {
                    return (from _q in _db.Questionnaires
                            where _q.chrIsDeleted.Equals('N')
                            && _q.intQuestionnaireType.Equals(_intQuestionnaireTypeId)
                            orderby _q.strQuestionHeading ascending
                            select new Entity.QuestionnaireInfo()
                            {
                                StrQuestion = _q.strQuestion,
                                IntQuestionnaireId = _q.intQuestionnaireId,
                                ChrDisplayYes = _q.chrDisplayYes,
                                ChrDisplayNo = _q.chrDisplayNo,
                                ChrDisplayDontKnow = _q.chrDisplayDontKnow,
                                ChrIsActive = _q.chrIsActive,
                                IntQuestionnaireType = _q.intQuestionnaireType,
                                DtCreatedDate = _q.dtCreatedDate,
                                StrQuestionHeading = _q.strQuestionHeading
                            }).ToList();
                }
                else
                {
                    return (from _q in _db.Questionnaires
                            where _q.chrIsDeleted.Equals('N')
                            && _q.intQuestionnaireType.Equals(_intQuestionnaireTypeId)
                            select new Entity.QuestionnaireInfo()
                            {
                                StrQuestion = _q.strQuestion,
                                IntQuestionnaireId = _q.intQuestionnaireId,
                                ChrDisplayYes = _q.chrDisplayYes,
                                ChrDisplayNo = _q.chrDisplayNo,
                                ChrDisplayDontKnow = _q.chrDisplayDontKnow,
                                ChrIsActive = _q.chrIsActive,
                                IntQuestionnaireType = _q.intQuestionnaireType,
                                DtCreatedDate = _q.dtCreatedDate,
                                StrQuestionHeading = _q.strQuestionHeading
                            }).ToList();
                }
            }
        }

        /// Function Header*******************************************************
        /// Function Name: GetAllQuestionnaires
        /// Function Type: Function
        /// Functionality: used to update the details 
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.QuestionnaireInfo> GetAllQuestionnairesByHeading(int _intQuestionnaireTypeId, string _strHeading)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                return (from _q in _db.Questionnaires
                        where _q.chrIsDeleted.Equals('N')
                        && _q.intQuestionnaireType.Equals(_intQuestionnaireTypeId)
                        && _q.strQuestionHeading.ToLower().Equals(_strHeading.ToLower())
                        select new Entity.QuestionnaireInfo()
                        {
                            StrQuestion = _q.strQuestion,
                            IntQuestionnaireId = _q.intQuestionnaireId,
                            ChrDisplayYes = _q.chrDisplayYes,
                            ChrDisplayNo = _q.chrDisplayNo,
                            ChrDisplayDontKnow = _q.chrDisplayDontKnow,
                            ChrIsActive = _q.chrIsActive,
                            IntQuestionnaireType = _q.intQuestionnaireType,
                            DtCreatedDate = _q.dtCreatedDate,
                            StrQuestionHeading = _q.strQuestionHeading
                        }).ToList();
            }
        }

        /// Function Header*******************************************************
        /// Function Name: GetAllQuestionnaires
        /// Function Type: Function
        /// Functionality: used to update the details 
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public Entity.QuestionnaireInfo GetAllQuestionnairesById(int _intQuestionnaireId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                return (from _q in _db.Questionnaires
                        where _q.chrIsDeleted.Equals('N')
                        && _q.intQuestionnaireId.Equals(_intQuestionnaireId)
                        select new Entity.QuestionnaireInfo()
                        {
                            StrQuestion = _q.strQuestion,
                            IntQuestionnaireId = _q.intQuestionnaireId,
                            ChrDisplayYes = _q.chrDisplayYes,
                            ChrDisplayNo = _q.chrDisplayNo,
                            ChrDisplayDontKnow = _q.chrDisplayDontKnow,
                            ChrIsActive = _q.chrIsActive,
                            IntQuestionnaireType = _q.intQuestionnaireType,
                            DtCreatedDate = _q.dtCreatedDate,
                            StrQuestionHeading = _q.strQuestionHeading ?? "Select"
                        }).FirstOrDefault();

            }
        }

        /// Function Header*******************************************************
        /// Function Name: GetAllQuestionnaires
        /// Function Type: Function
        /// Functionality: used to update the details 
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.QuestionnaireInfo> GetGlobalCodesByCategoryName(string _strCategoryCode)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                return (from _q in _db.GlobalCodes
                        where _q.chrisActive.Equals('Y')
                        && _q.strGlobalCodeCategory.ToLower().Equals(_strCategoryCode.ToLower())
                        select new Entity.QuestionnaireInfo()
                        {
                            IntGlobalCodesId = _q.intGlobalCodesId,
                            StrGlobalCodeCategory = _q.strGlobalCodeCategory,
                            StrHeading = _q.strHeading,
                            StrValue = _q.strValue,
                            StrValueCode = _q.strValueCode
                        }).ToList();
            }
        }

         


        #endregion

    }
}
