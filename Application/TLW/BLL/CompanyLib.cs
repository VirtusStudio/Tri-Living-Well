///***********************************************************
///Author Name: Pardeep Kumar
///Creation Date: 21 Dec, 2010
///File Name:   CompanyLib.cs			Component Used: 
///Called From: Presentation layer 
///Description: This page will manage the company details
///Tables Accessed: 
///Program specs: TLW
///UTP doc:
///Tested By: 
///***********************************************************************
///Modification History:
///Change No.   Changed By	    Date	    Version	    Raised By/SRS No	    Description
///
/// 
///***********************************************************************
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Entity;

namespace BLL
{
    public class CompanyManager
    {

        #region Check Functions

        /// Function Header*******************************************************
        /// Function Name: GetCompanyDetailsById
        /// Function Type: Function
        /// Functionality: used to get the details of company by companyid
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public bool IsEmailIdExists(string[] strEmailId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varUserDuplicate = (from _au in _db.aspnet_Users
                                         where strEmailId.Contains(_au.LoweredUserName.ToLower())
                                         select new Entity.CompanyInfo
                                         {
                                             StrEmpEmail = _au.LoweredUserName
                                         }
                                        ).ToList();

                if (_varUserDuplicate != null && _varUserDuplicate.Count > 0)
                {
                    _varUserDuplicate = null;
                    return true;
                }
                else
                {
                    var _varCompDuplicate = (from _au in _db.CompanyInfos
                                             where strEmailId.Contains(_au.strCompanyEmail.ToLower())
                                             select new Entity.CompanyInfo
                                             {
                                                 StrEmpEmail = _au.strCompanyEmail
                                             }
                                              ).ToList();
                    if (_varCompDuplicate != null && _varCompDuplicate.Count > 0)
                    {
                        _varCompDuplicate = null;
                        return false;
                    }
                    else
                    {
                        var _varDupUser = (from _au in _db.CompanyRequestedUsersLists
                                           where strEmailId.Contains(_au.strEmpEmail.ToLower())
                                           select new Entity.CompanyInfo
                                           {
                                               StrEmpEmail = _au.strEmpEmail
                                           }
                                              ).ToList();
                        if (_varDupUser != null && _varDupUser.Count > 0)
                        {
                            _varDupUser = null;
                            return false;
                        }
                    }
                }
                return true;
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
        public Entity.CompanyInfo CheckLogin(string strEmailId, string strPassword)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varCompDuplicate = (from _au in _db.CompanyInfos
                                         where _au.strCompanyEmail.Equals(strEmailId.ToLower())
                                            && _au.strPassword.Equals(strPassword)
                                            && _au.chrIsActive.Equals('Y')
                                         select new Entity.CompanyInfo
                                         {
                                             StrEmpEmail = _au.strCompanyEmail,
                                             IntUserId = 1
                                         }
                                                 ).FirstOrDefault();
                return _varCompDuplicate;
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
        public Entity.CompanyInfo CheckEmailIDExistsInCompany(string strEmailId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varCompDuplicate = (from _au in _db.CompanyInfos
                                         where _au.strCompanyEmail.Equals(strEmailId.ToLower())
                                          && _au.chrIsActive.Equals('Y')
                                         select new Entity.CompanyInfo
                                         {
                                             StrEmpEmail = _au.strCompanyEmail,
                                             StrCompanyName = _au.strCompanyName,
                                             IntUserId = 1
                                         }
                                                 ).FirstOrDefault();
                return _varCompDuplicate;
            }
        }


        #endregion

        #region Insert Functions

        /// Function Header*******************************************************
        /// Function Name: SaveCompanyDetails
        /// Function Type: Function
        /// Functionality: used to save the details of company
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int SaveCompanyDetails(Entity.CompanyInfo oCompanyInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 1;
                /* var _varUserDuplicate = _db.aspnet_Users.Where(x => x.LoweredUserName.Equals(oCompanyInfo.StrCompanyEmail.ToLower())).SingleOrDefault();
                 if (_varUserDuplicate != null)
                 {
                     intRetVal = -1;
                     _varUserDuplicate = null;
                 }
                 else
                 {
                     var _varCompDuplicate = _db.CompanyInfos.Where(x => x.strCompanyEmail.ToLower().Equals(oCompanyInfo.StrCompanyEmail.ToLower())).SingleOrDefault();
                     if (_varCompDuplicate != null)
                     {
                         intRetVal = -1;
                         _varCompDuplicate = null;
                     }
                 }


                 if (intRetVal.Equals(0))
                 {*/
                DAL.CompanyInfo oCompanyInfoDAL = new DAL.CompanyInfo();
                oCompanyInfoDAL.strCompanyEmail = oCompanyInfo.StrCompanyEmail;
                oCompanyInfoDAL.strPassword = oCompanyInfo.StrPassword;
                oCompanyInfoDAL.strCompanyName = oCompanyInfo.StrCompanyName;
                oCompanyInfoDAL.strCompanyPhone = oCompanyInfo.StrCompanyPhone;
                oCompanyInfoDAL.strCompanyFax = oCompanyInfo.StrCompanyFax;
                oCompanyInfoDAL.intCountryId = oCompanyInfo.IntCountryId;
                oCompanyInfoDAL.intStateId = oCompanyInfo.IntStateId;
                oCompanyInfoDAL.strStateText = oCompanyInfo.StrStateName;

                // David K. Bowers 04/10/12 added in zip code
                
                oCompanyInfoDAL.strZipCode = oCompanyInfo.StrZipCode;
                // David K. Bowers 04/09/12 fixed a bug where company address was not getting stored in DB
                oCompanyInfoDAL.strCompanyAddress = oCompanyInfo.StrCompanyAddress;
                oCompanyInfoDAL.strCity = oCompanyInfo.StrCity;
                oCompanyInfoDAL.chrIsPaid = oCompanyInfo.ChrIsPaid;
                oCompanyInfoDAL.chrIsActive = oCompanyInfo.ChrIsActive;
                oCompanyInfoDAL.dtCreatedDate = oCompanyInfo.DtCreatedDate;
                oCompanyInfoDAL.dtModifiedDate = oCompanyInfo.DtModifiedDate;
                oCompanyInfoDAL.chrIsDeleted = oCompanyInfo.ChrIsDeleted;
                oCompanyInfoDAL.chrCreatedBy = oCompanyInfo.ChrCreatedBy;
                oCompanyInfoDAL.chrIsApproved = oCompanyInfo.ChrIsApproved;
                _db.CompanyInfos.InsertOnSubmit(oCompanyInfoDAL);
                _db.SubmitChanges();
                _db.ms_UpdateUserINRoles(oCompanyInfoDAL.strCompanyEmail);
                intRetVal = oCompanyInfoDAL.intCompanyId;
                oCompanyInfoDAL = null;
                /* }*/


                return intRetVal;
            }

        }

        /// Function Header*******************************************************
        /// Function Name: SaveRequestCompanyForUserRegistration
        /// Function Type: Function
        /// Functionality: used to save the details of users who are requested by company
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int CreateNewState(string _strStateName)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {

                return 1;

            }

        }

        /// Function Header*******************************************************
        /// Function Name: SaveQuestionToHealthCoachFromUser
        /// Function Type: Function
        /// Functionality: used to save the question from user
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int SaveQuestionToHealthCoachFromUser(Entity.CompanyInfo oCompanyInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 1;

                DAL.QuestionsForHealthCoach oQuestionsForHealthCoach = new QuestionsForHealthCoach();
                oQuestionsForHealthCoach.strUserName = oCompanyInfo.StrUserName;
                oQuestionsForHealthCoach.strCategoryName = oCompanyInfo.StrCategoryName;
                oQuestionsForHealthCoach.strCategoryLevel = oCompanyInfo.StrCategoryLevel;
                oQuestionsForHealthCoach.strQuestion = oCompanyInfo.StrQuestion;
                oQuestionsForHealthCoach.strSubject = oCompanyInfo.StrSubject;
                oQuestionsForHealthCoach.strComments = oCompanyInfo.StrComments;
                oQuestionsForHealthCoach.strQuestionType = oCompanyInfo.StrQuestionType;

                oQuestionsForHealthCoach.dtCreatedOn = oCompanyInfo.DtCreatedOn;
                oQuestionsForHealthCoach.chrIsAnsweredGiven = oCompanyInfo.ChrIsAnsweredGiven;
                oQuestionsForHealthCoach.chrIsDeleted = oCompanyInfo.ChrIsDeleted;
                _db.QuestionsForHealthCoaches.InsertOnSubmit(oQuestionsForHealthCoach);

                _db.SubmitChanges();

                return intRetVal;
            }

        }

        /// Function Header*******************************************************
        /// Function Name: SaveRequestCompanyForUserRegistration
        /// Function Type: Function
        /// Functionality: used to save the details of users who are requested by company
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int SaveRequestCompanyForUserRegistration(List<Entity.CompanyInfo> oListCompanyInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 0;
                foreach (var oCompanyInfo in oListCompanyInfo)
                {
                    intRetVal = 0;
                    var _varUserDuplicate = _db.aspnet_Users.Where(x => x.LoweredUserName.Equals(oCompanyInfo.StrEmpEmail.ToLower())).SingleOrDefault();
                    if (_varUserDuplicate != null)
                    {
                        intRetVal = -1;
                        _varUserDuplicate = null;
                    }
                    else
                    {
                        var _varCompDuplicate = _db.CompanyInfos.Where(x => x.strCompanyEmail.ToLower().Equals(oCompanyInfo.StrEmpEmail.ToLower())).SingleOrDefault();
                        if (_varCompDuplicate != null)
                        {
                            intRetVal = -1;
                            _varCompDuplicate = null;
                        }
                        else
                        {
                            var _varRequestUserDuplicate = _db.CompanyRequestedUsersLists.Where(x => x.strEmpEmail.ToLower().Equals(oCompanyInfo.StrEmpEmail.ToLower())).SingleOrDefault();
                            if (_varRequestUserDuplicate != null)
                            {
                                intRetVal = -1;
                                _varRequestUserDuplicate = null;
                            }
                        }
                    }

                    if (intRetVal.Equals(0))
                    {

                        DAL.CompanyRequestedUsersList oCompanyRequestedUsersListDAL = new CompanyRequestedUsersList();
                        oCompanyRequestedUsersListDAL.intCompanyId = oCompanyInfo.IntCompanyId;
                        oCompanyRequestedUsersListDAL.strEmpCode = oCompanyInfo.StrEmpCode;
                        oCompanyRequestedUsersListDAL.strEmpFirstName = oCompanyInfo.StrEmpFirstName;
                        oCompanyRequestedUsersListDAL.strEmpMiddleName = oCompanyInfo.StrEmpMiddleName;
                        oCompanyRequestedUsersListDAL.strEmpLastName = oCompanyInfo.StrEmpLastName;
                        oCompanyRequestedUsersListDAL.strEmployeeAddress = oCompanyInfo.StrEmployeeAddress;
                        oCompanyRequestedUsersListDAL.dtEmpDateofBirth = oCompanyInfo.DtEmpDateofBirth;
                        oCompanyRequestedUsersListDAL.strEmpEmail = oCompanyInfo.StrEmpEmail;
                        oCompanyRequestedUsersListDAL.strEmpRelationShipCode = oCompanyInfo.StrEmpRelationShipCode;
                        oCompanyRequestedUsersListDAL.strEmpFamilyStatus = oCompanyInfo.StrEmpFamilyStatus;
                        oCompanyRequestedUsersListDAL.strEmpGender = oCompanyInfo.StrEmpGender;
                        oCompanyRequestedUsersListDAL.strEmpPhoneORCell = oCompanyInfo.StrEmpPhoneORCell;


                        oCompanyRequestedUsersListDAL.chrStatus = oCompanyInfo.ChrStatus;
                        oCompanyRequestedUsersListDAL.dtCreatedDate = oCompanyInfo.DtCreatedDate;
                        _db.CompanyRequestedUsersLists.InsertOnSubmit(oCompanyRequestedUsersListDAL);
                        _db.SubmitChanges();
                        intRetVal = oCompanyRequestedUsersListDAL.intCompanyRequestedUsersListId;
                        oCompanyRequestedUsersListDAL = null;
                    }
                }

                return intRetVal;
            }

        }

        #endregion

        #region Search Functions

        /// Function Header*******************************************************
        /// Function Name: SearchCompanies
        /// Function Type: Function
        /// Functionality: used to search the details of company
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.CompanyInfo> SearchCompanies(Entity.CompanyInfo oCompanyInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varCompanyInfo = (from _ci in _db.CompanyInfos
                                       where _ci.chrIsDeleted.Equals('N')
                                       && _ci.chrIsApproved.Equals('Y')
                                       orderby _ci.dtCreatedDate descending
                                       select new Entity.CompanyInfo()
                                       {
                                           StrCompanyName = _ci.strCompanyName,
                                           StrCompanyEmail = _ci.strCompanyEmail,
                                           StrCompanyPhone = _ci.strCompanyPhone,
                                           ChrIsActive = _ci.chrIsActive ?? 'Y',
                                           DtCreatedDate = _ci.dtCreatedDate ?? DateTime.Now,
                                           DtModifiedDate = _ci.dtModifiedDate ?? DateTime.Now,
                                           IntCompanyId = _ci.intCompanyId,
                                           ChrIsApproved = _ci.chrIsApproved ?? 'Y'
                                       }).ToList();

                var _varRetVal = _varCompanyInfo;
                if (!oCompanyInfo.StrCompanyEmail.Equals(string.Empty))
                    _varRetVal = _varRetVal.Where(x => x.StrCompanyEmail.ToLower().Contains(oCompanyInfo.StrCompanyEmail.ToLower())).ToList();

                if (!oCompanyInfo.StrCompanyName.Equals(string.Empty))
                    _varRetVal = _varRetVal.Where(x => x.StrCompanyName.ToLower().Contains(oCompanyInfo.StrCompanyName.ToLower())).ToList();

                if (!oCompanyInfo.ChrIsActive.Equals('X'))
                    _varRetVal = _varRetVal.Where(x => x.ChrIsActive.Equals(oCompanyInfo.ChrIsActive)).ToList();


                return _varRetVal;
            }

        }


        /// Function Header*******************************************************
        /// Function Name: SearchCompanies
        /// Function Type: Function
        /// Functionality: used to search the details of company
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.CompanyInfo> SearchRequestedUsersForCompanies(int intCompanyId, char chrStatus)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varCompanyInfo = (from _ci in _db.CompanyRequestedUsersLists
                                       where _ci.chrStatus.Equals(chrStatus)
                                       && _ci.intCompanyId.Equals(intCompanyId)
                                       select new Entity.CompanyInfo()
                                       {
                                           StrEmpCode = _ci.strEmpCode,
                                           StrEmpEmail = _ci.strEmpEmail,
                                           StrEmpFirstName = _ci.strEmpFirstName + " " + _ci.strEmpMiddleName + " " + _ci.strEmpLastName ?? "",
                                           DtCreatedDate = _ci.dtCreatedDate ?? DateTime.Now,
                                           IntCompanyRequestedUsersListId = _ci.intCompanyRequestedUsersListId,
                                           IntCompanyId = _ci.intCompanyId,
                                           StrCompanyName = _db.CompanyInfos.Where(x => x.intCompanyId.Equals(_ci.intCompanyId)).Select(x => x.strCompanyName).FirstOrDefault(),
                                           DtModifiedDate = _ci.dtModifiedDate ?? _ci.dtCreatedDate ?? DateTime.Now,
                                           ChrStatus = _ci.chrStatus ?? 'I'
                                           //ChrIsApproved = _ci.chrIsApproved ?? 'Y'
                                       }).ToList();
                return _varCompanyInfo;
            }
        }



        /// Function Header*******************************************************
        /// Function Name: SearchCompanies
        /// Function Type: Function
        /// Functionality: used to search the details of company
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public Entity.CompanyInfo CheckCompanyLogin(string strEmail, string strPassword)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varCompanyInfo = (from _ci in _db.CompanyInfos
                                       where _ci.chrIsDeleted.Equals('N')
                                       && _ci.strCompanyEmail.ToLower().Equals(strEmail.ToLower())
                                       && _ci.strPassword.Equals(strPassword)
                                       select new Entity.CompanyInfo()
                                       {
                                           ChrIsActive = _ci.chrIsActive ?? 'Y',
                                           IntCompanyId = _ci.intCompanyId,
                                           ChrIsApproved = _ci.chrIsApproved ?? 'Y'
                                       }).FirstOrDefault();


                return _varCompanyInfo;
            }
        }

        #endregion

        #region Binding Functions


        /// Function Header*******************************************************
        /// Function Name: SaveQuestionToHealthCoachFromUser
        /// Function Type: Function
        /// Functionality: used to save the question from user
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.CompanyInfo> GetQuestionsForHealthCoachFromUser(Entity.CompanyInfo oCompanyInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varQuestionList = (from _qfhc in _db.QuestionsForHealthCoaches
                                        orderby _qfhc.dtCreatedOn descending
                                        select new Entity.CompanyInfo
                                        {
                                            IntQuestionId = _qfhc.intQuestionId,
                                            StrCategoryName = _qfhc.strCategoryName,
                                            StrQuestion = _qfhc.strQuestion,
                                            StrSubject = _qfhc.strSubject,
                                            StrComments = _qfhc.strComments,
                                            StrQuestionType = _qfhc.strQuestionType,
                                            ChrIsAnsweredGiven = _qfhc.chrIsAnsweredGiven,
                                            StrUserName = _qfhc.strUserName,
                                            DtCreatedOn = _qfhc.dtCreatedOn,
                                            StrCategoryLevel = _qfhc.strCategoryLevel ?? ""
                                        }
                                        ).ToList();
                if (!oCompanyInfo.StrCategoryName.ToLower().Equals("x"))
                    _varQuestionList = _varQuestionList.Where(x => x.StrCategoryName.ToLower().Equals(oCompanyInfo.StrCategoryName.ToLower())).ToList();

                if (!oCompanyInfo.StrQuestionType.ToLower().Equals("x"))
                    _varQuestionList = _varQuestionList.Where(x => x.StrQuestionType.ToLower().Equals(oCompanyInfo.StrQuestionType.ToLower())).ToList();

                if (!oCompanyInfo.ChrIsAnsweredGiven.Equals('x'))
                    _varQuestionList = _varQuestionList.Where(x => x.ChrIsAnsweredGiven.Equals(oCompanyInfo.ChrIsAnsweredGiven)).ToList();

                if (oCompanyInfo.StrUserName != null && oCompanyInfo.StrUserName != string.Empty)
                {
                    _varQuestionList = _varQuestionList.Where(x => x.StrUserName.ToLower().Equals(oCompanyInfo.StrUserName.ToLower())).ToList();
                }

                return _varQuestionList;
            }
        }


        /// Function Header*******************************************************
        /// Function Name: SaveQuestionToHealthCoachFromUser
        /// Function Type: Function
        /// Functionality: used to save the question from user
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public Entity.CompanyInfo GetQuestionsForHealthCoachFromUserByQuestionId(int _intQuestionId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varQuestionList = (from _qfhc in _db.QuestionsForHealthCoaches
                                        where _qfhc.intQuestionId.Equals(_intQuestionId)
                                        select new Entity.CompanyInfo
                                        {
                                            IntQuestionId = _qfhc.intQuestionId,
                                            StrCategoryName = _qfhc.strCategoryName,
                                            StrQuestion = _qfhc.strQuestion,
                                            StrSubject = _qfhc.strSubject,
                                            StrComments = _qfhc.strComments,
                                            StrQuestionType = _qfhc.strQuestionType,
                                            ChrIsAnsweredGiven = _qfhc.chrIsAnsweredGiven,
                                            StrUserName = _qfhc.strUserName,
                                            DtCreatedOn = _qfhc.dtCreatedOn,
                                            StrCategoryLevel = _qfhc.strCategoryLevel ?? ""
                                        }
                                        ).FirstOrDefault();
                return _varQuestionList;
            }
        }

        /// Function Header*******************************************************
        /// Function Name: SaveQuestionToHealthCoachFromUser
        /// Function Type: Function
        /// Functionality: used to save the question from user
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.CompanyInfo> GetAnswerofPrivateQuestionByQuestionId(int _intQuestionId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varQuestionList = (from _qfhc in _db.UsersPrivateAnswers
                                        where _qfhc.intQuestionId.Equals(_intQuestionId)
                                        orderby _qfhc.intAnswerId descending
                                        select new Entity.CompanyInfo
                                        {
                                            StrAnswer = _qfhc.strAnswer,
                                            StrAnsweredBy = _qfhc.strAnswerBy,
                                            DtAnsweredOn = _qfhc.dtAnsweredOn
                                        }
                                        ).Take(1).ToList();
                return _varQuestionList;
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
        /// 4/10/12 David K. Bowers added in zip code
        /// *********************************************************************
        public Entity.CompanyInfo GetCompanyDetailsById(int intCompanyId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _ci in _db.CompanyInfos
                                  where _ci.intCompanyId.Equals(intCompanyId)
                                  select new Entity.CompanyInfo()
                                  {
                                      ChrIsActive = _ci.chrIsActive ?? 'Y',
                                      DtCreatedDate = _ci.dtCreatedDate ?? DateTime.Now,
                                      IntCompanyId = _ci.intCompanyId,
                                      IntCountryId = _ci.intCountryId ?? 0,
                                      IntStateId = _ci.intStateId ?? 0,
                                      StrZipCode = _ci.strZipCode ?? "",
                                      StrCity = _ci.strCity ?? "",
                                      StrCompanyAddress = _ci.strCompanyAddress ?? "",
                                      StrCompanyEmail = _ci.strCompanyEmail,
                                      StrCompanyFax = _ci.strCompanyFax ?? "",
                                      StrCompanyName = _ci.strCompanyName,
                                      StrCompanyPhone = _ci.strCompanyPhone ?? "",
                                      ChrIsApproved = _ci.chrIsApproved ?? 'Y',
                                      StrStateName = _ci.strStateText ?? ""
                                  }).FirstOrDefault();
                return _varRetVal;
            }
        }

        /// Function Header*******************************************************
        /// Function Name: GetCompanyAllCompanies
        /// Function Type: Function
        /// Functionality: used to get all the companies
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.CompanyInfo> GetCompanyAllCompanies()
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _ci in _db.CompanyInfos
                                  where _ci.chrIsActive.Equals('Y')
                                  && _ci.chrIsApproved.Equals('Y')
                                  select new Entity.CompanyInfo()
                                  {
                                      StrEmpEmail = _ci.strCompanyEmail,
                                      IntCompanyId = _ci.intCompanyId,
                                      StrCompanyName = _ci.strCompanyName,
                                      StrCompanyPhone = _ci.strCompanyPhone ?? "",
                                      ChrIsApproved = _ci.chrIsApproved ?? 'Y'
                                  }).ToList();
                return _varRetVal;
            }

        }

        /// Function Header*******************************************************
        /// Function Name: GetCompanyAllCompanies
        /// Function Type: Function
        /// Functionality: used to get all the companies
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public Entity.CompanyInfo GetCompanyDetailsByEmailId(string strEmailId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _ci in _db.CompanyInfos
                                  where _ci.strCompanyEmail.Equals(strEmailId)

                                  select new Entity.CompanyInfo()
                                  {

                                      IntCompanyId = _ci.intCompanyId,
                                      StrCompanyName = _ci.strCompanyName,
                                      StrCompanyPhone = _ci.strCompanyPhone ?? "",
                                      ChrIsApproved = _ci.chrIsApproved ?? 'Y'
                                  }).FirstOrDefault();
                return _varRetVal;
            }

        }

        /// Function Header*******************************************************
        /// Function Name: GetCompanyAllCompanies
        /// Function Type: Function
        /// Functionality: used to get all the companies
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.CompanyInfo> GetUsersByCompanyId(int _intCompanyId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {

                var _varRetObj = (from _ui in _db.USER_INFOs
                                  join _memship in _db.aspnet_Memberships
                                  on _ui.USER_ID equals _memship.UserId
                                  where _ui.intCompanyId.Equals(_intCompanyId)
                                  select new Entity.CompanyInfo()
                                  {
                                      StrEmpEmail = _memship.LoweredEmail,
                                      StrUserName = _memship.LoweredEmail
                                  }).ToList();

                return _varRetObj;
            }

        }

        /// Function Header*******************************************************
        /// Function Name: GetCompanyAllCompanies
        /// Function Type: Function
        /// Functionality: used to get all the companies
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public Entity.CompanyInfo GetCompanyDetailsByCompanyandRequestedUserId(int _intCompanyId, int _intCompanyRequestedUserId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _ci in _db.CompanyInfos
                                  join _cri in _db.CompanyRequestedUsersLists
                                  on _ci.intCompanyId equals _cri.intCompanyId
                                  where _cri.intCompanyRequestedUsersListId.Equals(_intCompanyRequestedUserId)
                                  && _cri.intCompanyId.Equals(_intCompanyId)

                                  select new Entity.CompanyInfo()
                                  {

                                      IntCompanyId = _ci.intCompanyId,
                                      StrCompanyName = _ci.strCompanyName,
                                      StrCompanyPhone = _ci.strCompanyPhone ?? "",
                                      ChrIsApproved = _ci.chrIsApproved ?? 'Y',
                                      StrEmpEmail = _cri.strEmpEmail
                                      
                                  }).FirstOrDefault();
                return _varRetVal;
            }

        }


        /// Function Header*******************************************************
        /// Function Name: GetCompanyAllCompanies
        /// Function Type: Function
        /// Functionality: used to get all the companies
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.CompanyInfo> GetAllUsers()
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _ci in _db.aspnet_Memberships
                                  where _ci.IsApproved.Equals(1)
                                  select new Entity.CompanyInfo()
                                  {
                                      StrEmpEmail = _ci.LoweredEmail
                                  }).ToList();
                return _varRetVal;
            }
        }

        /// Function Header*******************************************************
        /// Function Name: GetCompanyAllCompanies
        /// Function Type: Function
        /// Functionality: used to get all the companies
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public Entity.CompanyInfo GetUserDetailsByUsername(string _strUserName)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _ci in _db.USER_INFOs
                                  join _au in _db.aspnet_Users
                                  on _ci.USER_ID equals _au.UserId
                                  where _au.UserName.Equals(_strUserName)
                                  select new Entity.CompanyInfo
                                  {
                                      StrUserFullName = _ci.FNAME + " " + _ci.LNAME
                                  }).SingleOrDefault();
                return _varRetVal;
            }
        }


        public int GetQuestion()
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var res = (from c in _db.QuestionsForHealthCoaches
                           where c.chrIsAnsweredGiven == Convert.ToChar('N')
                           select c.chrIsAnsweredGiven).Count();

                int result = Convert.ToInt32(res);
                return result;
            }
        }

        public int GetAnswers(string useranme)
        {

           

            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var res = (from c in _db.QuestionsForHealthCoaches
                           where c.strUserName.Equals(useranme)
                           && c.chrIsAnsweredGiven == Convert.ToChar('Y') 
                           select c.chrIsAnsweredGiven).Count();

                int result = Convert.ToInt32(res);
                return result;
            }
        }


        #endregion

        #region Update Functions

        /// Function Header*******************************************************
        /// Function Name: UpdateCompanyDetails
        /// Function Type: Function
        /// Functionality: used to Update the details of company
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        /// 04/09/12 David K. Bowers fixed a bug where address change was not getting stored in db
        /// 04/10/12 David K Bowers added in zip code
        public int UpdateCompanyDetails(Entity.CompanyInfo oCompanyInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 0;
                if (intRetVal.Equals(0))
                {
                    DAL.CompanyInfo oCompanyInfoDAL = _db.CompanyInfos.Where(x => x.intCompanyId.Equals(oCompanyInfo.IntCompanyId)).FirstOrDefault();

                    oCompanyInfoDAL.strCompanyName = oCompanyInfo.StrCompanyName;
                    oCompanyInfoDAL.strCompanyPhone = oCompanyInfo.StrCompanyPhone;
                    oCompanyInfoDAL.strCompanyFax = oCompanyInfo.StrCompanyFax;
                    oCompanyInfoDAL.intCountryId = oCompanyInfo.IntCountryId;
                    oCompanyInfoDAL.intStateId = oCompanyInfo.IntStateId;
                    oCompanyInfoDAL.strStateText = oCompanyInfo.StrStateName;
                    oCompanyInfoDAL.strZipCode = oCompanyInfo.StrZipCode;
                    oCompanyInfoDAL.strCity = oCompanyInfo.StrCity;
                    //04/09/12 David K. Bowers fixed a bug where address change was not getting stored in db
                    oCompanyInfoDAL.strCompanyAddress = oCompanyInfo.StrCompanyAddress;
                    oCompanyInfoDAL.chrIsActive = oCompanyInfo.ChrIsActive;
                    oCompanyInfoDAL.dtModifiedDate = oCompanyInfo.DtModifiedDate;
                    oCompanyInfoDAL.chrIsApproved = oCompanyInfo.ChrIsApproved;
                    _db.SubmitChanges();
                    intRetVal = oCompanyInfoDAL.intCompanyId;
                    oCompanyInfoDAL = null;
                    oCompanyInfo = null;
                }


                return intRetVal;
            }
        }

        /// Function Header*******************************************************
        /// Function Name: UpdateCompanyDetails
        /// Function Type: Function
        /// Functionality: used to Update the details of company
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void UpdateCompanyActiveStatus(int intCompanyId, DateTime dtModifiedDate)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {

                var _varCompInfo = _db.CompanyInfos.Where(x => x.intCompanyId.Equals(intCompanyId)).FirstOrDefault();
                if (_varCompInfo != null)
                {
                    _varCompInfo.chrIsActive = _varCompInfo.chrIsActive.Equals('Y') ? 'N' : 'Y';
                    _varCompInfo.dtModifiedDate = dtModifiedDate;

                    var varAspMembeShip = _db.aspnet_Memberships.Where(x => x.UserId.Equals(_varCompInfo.strUserID)).FirstOrDefault();
                    varAspMembeShip.IsApproved = _varCompInfo.chrIsActive.Equals('Y') ? true : false;

                    _db.SubmitChanges();
                }

            }
        }

        /// Function Header*******************************************************
        /// Function Name: UpdateCompanyApprovedStatus
        /// Function Type: Function
        /// Functionality: used to disapproved the company
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void UpdateCompanyApprovedStatus(List<Entity.CompanyInfo> objListCompanyInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                foreach (var item in objListCompanyInfo)
                {
                    var _varCompInfo = _db.CompanyInfos.Where(x => x.intCompanyId.Equals(item.IntCompanyId)).FirstOrDefault();
                    if (_varCompInfo != null)
                    {
                        _varCompInfo.chrIsApproved = item.ChrIsApproved;
                        _db.SubmitChanges();
                    }
                }
            }
        }

        /// Function Header*******************************************************
        /// Function Name: UpdateCompanyApprovedStatus
        /// Function Type: Function
        /// Functionality: used to disapproved the company
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void UpdateRequestUserStatus(List<Entity.CompanyInfo> objListCompanyInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                foreach (var item in objListCompanyInfo)
                {
                    var _varCompInfo = _db.CompanyRequestedUsersLists.Where(x => x.intCompanyRequestedUsersListId.Equals(item.IntCompanyRequestedUsersListId)).FirstOrDefault();
                    if (_varCompInfo != null)
                    {
                        _varCompInfo.chrStatus = item.ChrStatus;
                        _varCompInfo.dtModifiedDate = item.DtModifiedDate;

                        _db.SubmitChanges();
                    }
                }
            }
        }

        /// Function Header*******************************************************
        /// Function Name: PrivateAnsweredtoUsersQuestion
        /// Function Type: Function
        /// Functionality: used to save the answered to private question
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int SaveAnswerFromHealthCoach(Entity.CompanyInfo oCompanyInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 1;

                DAL.UsersPrivateAnswer oUsersPrivateAnswer = new UsersPrivateAnswer();


                oUsersPrivateAnswer.intQuestionId = oCompanyInfo.IntQuestionId;
                oUsersPrivateAnswer.strAnswer = oCompanyInfo.StrAnswer;
                oUsersPrivateAnswer.dtAnsweredOn = oCompanyInfo.DtAnsweredOn;
                oUsersPrivateAnswer.strAnswerBy = oCompanyInfo.StrAnsweredBy;


                _db.UsersPrivateAnswers.InsertOnSubmit(oUsersPrivateAnswer);


                if (oCompanyInfo.StrQuestionType.ToLower().Equals("public"))
                {
                    var _varFAQ = (from _f in _db.FAQs
                                   where _f.intQuestionId.Equals(oCompanyInfo.IntQuestionId)
                                   select _f).FirstOrDefault();
                    if (_varFAQ != null)
                    {
                        _varFAQ.strAnswer = oCompanyInfo.StrAnswer;
                    }
                    else
                    {
                        DAL.FAQ oFAQ = new FAQ();
                        oFAQ.intQuestionId = oCompanyInfo.IntQuestionId;
                        oFAQ.strHeading = "Users FAQ";
                        oFAQ.strQuestion = oCompanyInfo.StrQuestion;
                        oFAQ.strAnswer = oCompanyInfo.StrAnswer;
                        oFAQ.chrUserType = 'U';
                        oFAQ.dtCreatedOn = oCompanyInfo.DtAnsweredOn;
                        oFAQ.strUserId = oCompanyInfo.StrUserId;
                        oFAQ.chrisDeleted = 'N';
                        _db.FAQs.InsertOnSubmit(oFAQ);
                    }

                }

                var _varQuestion = _db.QuestionsForHealthCoaches.Where(x => x.intQuestionId.Equals(oCompanyInfo.IntQuestionId)).FirstOrDefault();
                if (_varQuestion != null)
                {
                    _varQuestion.strQuestionType = oCompanyInfo.StrQuestionType;
                    _varQuestion.chrIsAnsweredGiven = 'Y';
                    //  _db.SubmitChanges();
                }



                _db.SubmitChanges();
                return intRetVal;
            }

        }

        #endregion

    }
}
