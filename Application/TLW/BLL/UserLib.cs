using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;

namespace BLL
{
    public class UserLib
    {

        #region Insert Functions

        /// Function Header*******************************************************
        /// Function Name: InesrtSectionVisitedDetails
        /// Function Type: Function
        /// Functionality: used to insert the section visited details
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void InesrtSectionVisitedDetails(Entity.UserInfo oUserInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {

                bool blnIsExists = false;
                var _varSectionVisited = (from _sv in _db.SectionVisiteds
                                          orderby _sv.dtCreatedOn descending
                                          select _sv
                                              ).ToList().Take(1);
                if (_varSectionVisited != null)
                {
                    if (_varSectionVisited.ElementAt(0).strSectionVisited.ToLower().Equals(oUserInfo.StrSectionVisited.ToLower())
                        &&
                        _varSectionVisited.ElementAt(0).strUserId.ToLower().Equals(oUserInfo.StrUserId.ToLower()))
                    {
                        blnIsExists = true;
                    }
                }


                if (!blnIsExists)
                {
                    DAL.SectionVisited oSectionVisited = new SectionVisited();
                    oSectionVisited.strUserId = oUserInfo.StrUserId;
                    oSectionVisited.strUserType = oUserInfo.StrUserType;
                    oSectionVisited.dtCreatedOn = oUserInfo.DtCreatedOn;
                    oSectionVisited.strAgent = oUserInfo.StrAgent;
                    oSectionVisited.strVisitedIP = oUserInfo.StrVisitedIP;
                    oSectionVisited.strSectionVisited = oUserInfo.StrSectionVisited;
                    _db.SectionVisiteds.InsertOnSubmit(oSectionVisited);
                    _db.SubmitChanges();
                    oSectionVisited = null;
                }
            }
        }

        /// Function Header*******************************************************
        /// Function Name: InesrtSectionVisitedDetails
        /// Function Type: Function
        /// Functionality: used to insert the section visited details
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public bool InsertFAQ(Entity.UserInfo oUserInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                bool _blnRetVal = true;
                var _varFAQ = (from _f in _db.FAQs
                               where _f.strQuestion.ToLower().Equals(oUserInfo.StrQuestion.ToLower())
                               && _f.strHeading.ToLower().Equals(oUserInfo.StrHeading.ToLower())
                               && _f.chrisDeleted.Equals('N')
                               select _f).FirstOrDefault();
                if (_varFAQ != null)
                    _blnRetVal = false;
                else
                {
                    DAL.FAQ oFAQ = new FAQ();
                    oFAQ.intQuestionId = 0;
                    oFAQ.strHeading = oUserInfo.StrHeading;
                    oFAQ.strQuestion = oUserInfo.StrQuestion;
                    oFAQ.strAnswer = oUserInfo.StrAnswer;
                    oFAQ.chrUserType = oUserInfo.ChrUserType;
                    oFAQ.dtCreatedOn = oUserInfo.DtCreatedOn;

                    oFAQ.strUserId = oUserInfo.StrUserId;
                    oFAQ.chrisDeleted = 'N';
                    _db.FAQs.InsertOnSubmit(oFAQ);
                    _db.SubmitChanges();
                    oFAQ = null;

                }

                _varFAQ = null;
                return _blnRetVal;
            }
        }



        /// Function Header*******************************************************
        /// Function Name: NewsletterAddToFavorite
        /// Function Type: Function
        /// Functionality: used to insert the newsletter details in add to favorite functionality.
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public bool NewsletterAddToFavorite(Entity.UserInfo oUserInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                DAL.UserFavoriteDetail oUserFavoriteDetail = new UserFavoriteDetail();

                bool _blnRetVal = true;
                if (oUserInfo.IntFavoriteId > 0)
                {
                    var _varUFD = (from _ufd in _db.UserFavoriteDetails
                                   where _ufd.intFavoriteId.Equals(oUserInfo.IntFavoriteId)

                                   select _ufd).FirstOrDefault();

                    if (_varUFD != null)
                        _db.UserFavoriteDetails.DeleteOnSubmit(_varUFD);
                }
                else
                {
                    var _varNL = (from _nl in _db.Newsletters
                                  where _nl.intNewsLetterId.Equals(oUserInfo.IntFavoriteTypeId)
                                  select new Entity.UserInfo()
                                  {
                                      StrTitle = _nl.strTitle
                                  }
                                     ).SingleOrDefault();
                    if (_varNL != null)
                    {
                        oUserFavoriteDetail.strUserId = oUserInfo.StrUserId;
                        oUserFavoriteDetail.strTitle = _varNL.StrTitle;
                        oUserFavoriteDetail.strFavoriteType = oUserInfo.StrFavoriteType;
                        oUserFavoriteDetail.dtCreatedOn = oUserInfo.DtCreatedOn;
                        oUserFavoriteDetail.intFavoriteTypeId = oUserInfo.IntFavoriteTypeId;

                        _db.UserFavoriteDetails.InsertOnSubmit(oUserFavoriteDetail);
                    }
                }


                _db.SubmitChanges();
                oUserFavoriteDetail = null;
                //_varUFD = null;
                return _blnRetVal;
            }
        }


        /// Function Header*******************************************************
        /// Function Name: NewsletterAddToFavorite
        /// Function Type: Function
        /// Functionality: used to insert the newsletter details in add to favorite functionality.
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public bool LibraryAddToFavorite(Entity.UserInfo oUserInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                DAL.UserFavoriteDetail oUserFavoriteDetail = new UserFavoriteDetail();

                bool _blnRetVal = true;
                if (oUserInfo.IntFavoriteId > 0)
                {
                    var _varUFD = (from _ufd in _db.UserFavoriteDetails
                                   where _ufd.intFavoriteId.Equals(oUserInfo.IntFavoriteId)

                                   select _ufd).FirstOrDefault();

                    if (_varUFD != null)
                        _db.UserFavoriteDetails.DeleteOnSubmit(_varUFD);
                }
                else
                {
                    var _varNL = (from _nl in _db.Libraries
                                  where _nl.intLibraryId.Equals(oUserInfo.IntFavoriteTypeId)
                                  select new Entity.UserInfo()
                                  {
                                      StrTitle = _nl.strTitle
                                  }
                                     ).SingleOrDefault();
                    if (_varNL != null)
                    {
                        oUserFavoriteDetail.strUserId = oUserInfo.StrUserId;
                        oUserFavoriteDetail.strTitle = _varNL.StrTitle;
                        oUserFavoriteDetail.strFavoriteType = oUserInfo.StrFavoriteType;
                        oUserFavoriteDetail.dtCreatedOn = oUserInfo.DtCreatedOn;
                        oUserFavoriteDetail.intFavoriteTypeId = oUserInfo.IntFavoriteTypeId;

                        _db.UserFavoriteDetails.InsertOnSubmit(oUserFavoriteDetail);
                    }
                }


                _db.SubmitChanges();
                oUserFavoriteDetail = null;
                //_varUFD = null;
                return _blnRetVal;
            }
        }


        /// Function Header*******************************************************
        /// Function Name: NewsletterAddToFavorite
        /// Function Type: Function
        /// Functionality: used to insert the newsletter details in add to favorite functionality.
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public bool NewsletterAndannoucementsAddToFavorite(Entity.UserInfo oUserInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                DAL.UserFavoriteDetail oUserFavoriteDetail = new UserFavoriteDetail();

                bool _blnRetVal = true;
                if (oUserInfo.IntFavoriteId > 0)
                {
                    var _varUFD = (from _ufd in _db.UserFavoriteDetails
                                   where _ufd.intFavoriteId.Equals(oUserInfo.IntFavoriteId)

                                   select _ufd).FirstOrDefault();

                    if (_varUFD != null)
                        _db.UserFavoriteDetails.DeleteOnSubmit(_varUFD);
                }
                else
                {
                    var _varNL = (from _nl in _db.NewsandAnnouncements
                                  where _nl.intNewsAnnouncementsId.Equals(oUserInfo.IntFavoriteTypeId)
                                  select new Entity.UserInfo()
                                  {
                                      StrTitle = _nl.strHeading
                                  }
                                     ).SingleOrDefault();
                    if (_varNL != null)
                    {
                        oUserFavoriteDetail.strUserId = oUserInfo.StrUserId;
                        oUserFavoriteDetail.strTitle = _varNL.StrTitle;
                        oUserFavoriteDetail.strFavoriteType = oUserInfo.StrFavoriteType;
                        oUserFavoriteDetail.dtCreatedOn = oUserInfo.DtCreatedOn;
                        oUserFavoriteDetail.intFavoriteTypeId = oUserInfo.IntFavoriteTypeId;

                        _db.UserFavoriteDetails.InsertOnSubmit(oUserFavoriteDetail);
                    }
                }


                _db.SubmitChanges();
                oUserFavoriteDetail = null;
                //_varUFD = null;
                return _blnRetVal;
            }
        }

        /// Function Header*******************************************************
        /// Function Name: NewsletterAddToFavorite
        /// Function Type: Function
        /// Functionality: used to insert the newsletter details in add to favorite functionality.
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public bool EventAddToFavorite(Entity.UserInfo oUserInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                DAL.UserFavoriteDetail oUserFavoriteDetail = new UserFavoriteDetail();

                bool _blnRetVal = true;
                if (oUserInfo.IntFavoriteId > 0)
                {
                    var _varUFD = (from _ufd in _db.UserFavoriteDetails
                                   where _ufd.intFavoriteId.Equals(oUserInfo.IntFavoriteId)

                                   select _ufd).FirstOrDefault();

                    if (_varUFD != null)
                        _db.UserFavoriteDetails.DeleteOnSubmit(_varUFD);
                }
                else
                {
                    var _varNL = (from _nl in _db.Events
                                  where _nl.intEventsId.Equals(oUserInfo.IntFavoriteTypeId)
                                  select new Entity.UserInfo()
                                  {
                                      StrTitle = _nl.strActivity
                                  }
                                     ).SingleOrDefault();
                    if (_varNL != null)
                    {
                        oUserFavoriteDetail.strUserId = oUserInfo.StrUserId;
                        oUserFavoriteDetail.strTitle = _varNL.StrTitle;
                        oUserFavoriteDetail.strFavoriteType = oUserInfo.StrFavoriteType;
                        oUserFavoriteDetail.dtCreatedOn = oUserInfo.DtCreatedOn;
                        oUserFavoriteDetail.intFavoriteTypeId = oUserInfo.IntFavoriteTypeId;

                        _db.UserFavoriteDetails.InsertOnSubmit(oUserFavoriteDetail);
                    }
                }


                _db.SubmitChanges();
                oUserFavoriteDetail = null;
                //_varUFD = null;
                return _blnRetVal;
            }
        }


        #endregion

        #region Update Functions

        /// Function Header*******************************************************
        /// Function Name: UpdateUserStratificationStep
        /// Function Type: Function
        /// Functionality: used to check wheather the stratifcation details of user.
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public bool UpdateUserStratificationStep(Guid _guidUserId, string strStratificationStep)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varUserInfo = (from _ua in _db.USER_INFOs
                                    where _ua.USER_ID.Equals(_guidUserId)
                                    select _ua
                                          ).FirstOrDefault();
                if (_varUserInfo != null)
                {
                    _varUserInfo.strRiskStratificationProcessStep = strStratificationStep;
                    _db.SubmitChanges();
                    return true;
                }
                else
                    return false;
            }
        }



        /// Function Header*******************************************************
        /// Function Name: InesrtSectionVisitedDetails
        /// Function Type: Function
        /// Functionality: used to insert the section visited details
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public bool UpdateFAQ(Entity.UserInfo oUserInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                bool _blnRetVal = true;
                var _varFAQ = (from _f in _db.FAQs
                               where _f.strQuestion.ToLower().Equals(oUserInfo.StrQuestion.ToLower())
                               && _f.strHeading.ToLower().Equals(oUserInfo.StrHeading.ToLower())
                               && _f.chrisDeleted.Equals('N')
                               && _f.intFAQId != oUserInfo.IntFAQId
                               select _f).FirstOrDefault();
                if (_varFAQ != null)
                {
                    _blnRetVal = false;
                }
                else
                {
                    _varFAQ = (from _f in _db.FAQs
                               where
                                _f.intFAQId.Equals(oUserInfo.IntFAQId)
                               select _f).FirstOrDefault();

                    _varFAQ.strHeading = oUserInfo.StrHeading;
                    _varFAQ.strQuestion = oUserInfo.StrQuestion;
                    _varFAQ.strAnswer = oUserInfo.StrAnswer;
                    _db.SubmitChanges();
                }

                _varFAQ = null;
                return _blnRetVal;
            }
        }

        /// Function Header*******************************************************
        /// Function Name: InesrtSectionVisitedDetails
        /// Function Type: Function
        /// Functionality: used to insert the section visited details
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void DeleteFAQ(int _intFAQId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varFAQ = (from _f in _db.FAQs
                               where _f.intFAQId.Equals(_intFAQId)
                               select _f).FirstOrDefault();
                if (_varFAQ != null)
                {
                    _varFAQ.chrisDeleted = 'Y';
                    _varFAQ.dtDeletedOn = DateTime.Now;
                    _db.SubmitChanges();
                }

            }
        }



        /// Function Header*******************************************************
        /// Function Name: UpdateFavoriteTitle
        /// Function Type: Function
        /// Functionality: used to update the title of favorite
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void UpdateFavoriteTitle(int _intFavoriteid, string _strTitle)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                if (_strTitle.Length > 150)
                    _strTitle = _strTitle.Substring(0, 145);


                var _varFavDetails = _db.UserFavoriteDetails.Where(x => x.intFavoriteId.Equals(_intFavoriteid)).FirstOrDefault();
                if (_varFavDetails != null)
                {
                    _varFavDetails.strTitle = _strTitle;
                    _db.SubmitChanges();
                }


                _varFavDetails = null;
            }
        }





        #endregion

        #region Binding Functions

        /// Function Header*******************************************************
        /// Function Name: InesrtSectionVisitedDetails
        /// Function Type: Function
        /// Functionality: used to insert the section visited details
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.UserInfo> GetSectionVisitedDetails(Entity.UserInfo oUserInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                DAL.SectionVisited oSectionVisited = new SectionVisited();
                var _varSectionVisited = (from _sv in _db.SectionVisiteds
                                          where _sv.dtCreatedOn >= Convert.ToDateTime(oUserInfo.StrDateFrom)
                                             && _sv.dtCreatedOn <= Convert.ToDateTime(oUserInfo.StrDateTo)
                                          orderby _sv.dtCreatedOn descending
                                          select new Entity.UserInfo
                                          {
                                              IntSectionVisitedId = _sv.intSectionVisitedId,
                                              StrUserId = _sv.strUserId,
                                              StrUserType = _sv.strUserType.Equals("A") ? "Administrator" : _sv.strUserType.Equals("U") ? "User" : "Company",
                                              DtCreatedOn = _sv.dtCreatedOn,
                                              StrAgent = _sv.strAgent,
                                              StrVisitedIP = _sv.strVisitedIP,
                                              StrSectionVisited = _sv.strSectionVisited
                                          }).ToList();
                if (!oUserInfo.StrUserType.ToLower().Equals("x"))
                    _varSectionVisited = _varSectionVisited.Where(x => x.StrUserType.ToLower().Equals(oUserInfo.StrUserType.ToLower())).ToList();
                if (!oUserInfo.StrSectionVisited.Equals(string.Empty))
                    _varSectionVisited = _varSectionVisited.Where(x => x.StrSectionVisited.ToLower().Contains(oUserInfo.StrSectionVisited.ToLower())).ToList();



                return _varSectionVisited;
            }
        }

        /// Function Header*******************************************************
        /// Function Name: GetFoodExchangeChartByCalories
        /// Function Type: Function
        /// Functionality: used to get the meal chart by calories.
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public Entity.UserInfo GetFoodExchangeChartByCalories(int _intCalories)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varFAQRet = (from _fChart in _db.ms_GetFoodExchangeChartByCalories(_intCalories)
                                  select new Entity.UserInfo
                                  {
                                      IntFoodExchangeChartId = _fChart.intFoodExchangeChartId,
                                      IntCalories = _fChart.intCalories,
                                      IntMilk = _fChart.intMilk,
                                      IntFruit = _fChart.intFruit,
                                      IntVegetable = _fChart.intVegetable,
                                      IntStarch = _fChart.intStarch,
                                      IntProtein = _fChart.intProtein,
                                      IntFat = _fChart.intFat,
                                      IntWater = _fChart.intWater,
                                      DtModifiedOn = _fChart.dtModifiedOn,
                                      StrModifiedBy = _fChart.strModifiedBy
                                  }
                               ).FirstOrDefault();


                return _varFAQRet;
            }
        }


        /// Function Header*******************************************************
        /// Function Name: InesrtSectionVisitedDetails
        /// Function Type: Function
        /// Functionality: used to insert the section visited details
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.UserInfo> GetAllFAQs()
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varFAQRet = (from _faq in _db.FAQs
                                  where _faq.chrisDeleted.Equals('N')
                                  orderby _faq.strHeading ascending
                                  select new Entity.UserInfo
                                  {
                                      IntFAQId = _faq.intFAQId,
                                      StrHeading = _faq.strHeading,
                                      StrQuestion = _faq.strQuestion,
                                      StrAnswer = _faq.strAnswer,
                                      ChrUserType = _faq.chrUserType,
                                      DtCreatedOn = _faq.dtCreatedOn,
                                      StrUserId = _faq.strUserId,
                                  }
                               ).ToList();


                return _varFAQRet;
            }
        }

        /// Function Header*******************************************************
        /// Function Name: InesrtSectionVisitedDetails
        /// Function Type: Function
        /// Functionality: used to insert the section visited details
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.UserInfo> GetAllFAQsByTopic(string _strTopic)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varFAQRet = (from _faq in _db.FAQs
                                  where _faq.chrisDeleted.Equals('N')
                                  && _faq.strHeading.ToLower().Equals(_strTopic.ToLower())
                                  orderby _faq.strHeading ascending
                                  select new Entity.UserInfo
                                  {
                                      IntFAQId = _faq.intFAQId,
                                      StrHeading = _faq.strHeading,
                                      StrQuestion = _faq.strQuestion,
                                      StrAnswer = _faq.strAnswer,
                                      ChrUserType = _faq.chrUserType,
                                      DtCreatedOn = _faq.dtCreatedOn,
                                      StrUserId = _faq.strUserId,
                                  }
                               ).ToList();


                return _varFAQRet;
            }
        }


        /// Function Header*******************************************************
        /// Function Name: InesrtSectionVisitedDetails
        /// Function Type: Function
        /// Functionality: used to insert the section visited details
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.UserInfo> GetAllFAQsTopicsFromFAQ()
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varFAQRet = (from _faq in _db.FAQs
                                  where _faq.chrisDeleted.Equals('N')
                                  orderby _faq.strHeading ascending
                                  select new Entity.UserInfo
                                  {
                                      StrHeading = _faq.strHeading

                                  }
                               ).Distinct().ToList();
                return _varFAQRet;
            }
        }


        /// Function Header*******************************************************
        /// Function Name: InesrtSectionVisitedDetails
        /// Function Type: Function
        /// Functionality: used to insert the section visited details
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.UserInfo> GetFAQTopics()
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varFAQRet = (from _faq in _db.FaqTopics
                                  where _faq.chrIsDeleted.Equals('N')
                                  orderby _faq.strFaqTopic ascending
                                  select new Entity.UserInfo
                                  {
                                      IntFAQTopicId = _faq.int_FAQTopicId,
                                      StrFaqTopic = _faq.strFaqTopic
                                  }
                               ).ToList();


                return _varFAQRet;
            }
        }

        /// Function Header*******************************************************
        /// Function Name: InesrtSectionVisitedDetails
        /// Function Type: Function
        /// Functionality: used to insert the section visited details
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public Entity.UserInfo GetAllFAQByFaqId(int _intFAQId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varFAQRet = (from _faq in _db.FAQs
                                  where _faq.chrisDeleted.Equals('N')
                                  && _faq.intFAQId.Equals(_intFAQId)
                                  select new Entity.UserInfo
                                  {
                                      IntFAQId = _faq.intFAQId,
                                      StrHeading = _faq.strHeading,
                                      StrQuestion = _faq.strQuestion,
                                      StrAnswer = _faq.strAnswer,
                                      ChrUserType = _faq.chrUserType,
                                      DtCreatedOn = _faq.dtCreatedOn,
                                      StrUserId = _faq.strUserId,
                                  }
                               ).FirstOrDefault();
                return _varFAQRet;
            }
        }

        /// Function Header*******************************************************
        /// Function Name: CheckUserAssessmentAlreadyExists
        /// Function Type: Function
        /// Functionality: used to check wheather the userassessment is exists or not.
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public bool CheckUserAssessmentAlreadyExists(Guid _guidUserId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varAssessment = (from _ua in _db.USER_ASSESSMENTs
                                      where _ua.USER_ID.Equals(_guidUserId)
                                      select _ua
                                          ).ToList();

                return _varAssessment.Count > 0 ? true : false;
            }
        }



        /// Function Header*******************************************************
        /// Function Name: CheckUserAssessmentAlreadyExists
        /// Function Type: Function
        /// Functionality: used to check wheather the userassessment is exists or not.
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public string GetRoleNameByUserName(string _strUsername)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                string strRetVal = string.Empty;
                var _varRoleName = (from _ar in _db.aspnet_Roles
                                    join _aur in _db.aspnet_UsersInRoles
                                    on _ar.RoleId equals _aur.RoleId
                                    join _au in _db.aspnet_Users
                                    on _aur.UserId equals _au.UserId
                                    where _au.UserName.Equals(_strUsername)
                                    select _ar
                                        ).ToList();
                if (_varRoleName.Count > 0)
                    strRetVal = _varRoleName.ElementAt(0).LoweredRoleName;


                if (strRetVal.Equals("administrator") || strRetVal.ToLower().Equals("health coach"))
                    strRetVal = "A";
                else if (strRetVal.Equals("company") || strRetVal.Equals("user"))
                    strRetVal = "U";

                return strRetVal;
            }
        }


        /// Function Header*******************************************************
        /// Function Name: CheckUserAssessmentAlreadyExists
        /// Function Type: Function
        /// Functionality: used to check wheather the userassessment is exists or not.
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public string GetUserTypeByUser(string _strUsername)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                string strRetVal = string.Empty;
                var _varRoleName = (from _ar in _db.aspnet_Roles
                                    join _aur in _db.aspnet_UsersInRoles
                                    on _ar.RoleId equals _aur.RoleId
                                    join _au in _db.aspnet_Users
                                    on _aur.UserId equals _au.UserId
                                    where _au.UserName.Equals(_strUsername)
                                    select _ar
                                        ).ToList();
                if (_varRoleName.Count > 0)
                    strRetVal = _varRoleName.ElementAt(0).LoweredRoleName;


                if (strRetVal.Equals("administrator") || strRetVal.ToLower().Equals("health coach"))
                    strRetVal = "A";
                else if (strRetVal.Equals("company"))
                    strRetVal = "C";
                else if (strRetVal.Equals("user"))
                    strRetVal = "U";
                return strRetVal;
            }
        }


        /// Function Header*******************************************************
        /// Function Name: CheckUserAssessmentAlreadyExists
        /// Function Type: Function
        /// Functionality: used to check wheather the userassessment is exists or not.
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.UserInfo> GetMETActivities()
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _ma in _db.METActivities
                                  select new Entity.UserInfo
                                  {
                                      IntActivityTypeId = _ma.intActivityTypeId,
                                      StrActivityName = _ma.strActivityName + " -- " + _ma.strDescription,
                                      StrDescription = _ma.strDescription,
                                      DecMET = _ma.decMET ?? 0,
                                      DtModifiedOn = _ma.dtModifiedOn,
                                      StrModifiedBy = _ma.strModifiedBy
                                  }
                                        ).ToList();
                return _varRetVal;
            }
        }


        /// Function Header*******************************************************
        /// Function Name: GetMETActivityDetailsByActivityId
        /// Function Type: Function
        /// Functionality: used to get the metactivity details by activity id
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public Entity.UserInfo GetMETActivityDetailsByActivityId(int _intActivityId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _ma in _db.METActivities
                                  where _ma.intActivityTypeId.Equals(_intActivityId)
                                  select new Entity.UserInfo
                                  {
                                      IntActivityTypeId = _ma.intActivityTypeId,
                                      StrActivityName = _ma.strActivityName + " -- " + _ma.strDescription,
                                      StrDescription = _ma.strDescription,
                                      DecMET = _ma.decMET ?? 0,
                                      DtModifiedOn = _ma.dtModifiedOn,
                                      StrModifiedBy = _ma.strModifiedBy
                                  }
                                        ).FirstOrDefault();
                return _varRetVal;
            }
        }

        #endregion

    }

    #region Class
    public class FoodIntakeLib
    {
    #endregion

        #region Insert Functions

        /// Function Header*******************************************************
        /// Function Name: InesrtSectionVisitedDetails
        /// Function Type: Function
        /// Functionality: used to insert the section visited details
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int InsertFoodIntakeDetails(Entity.FoodIntakeInfo oFoodIntakeInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int _intRetVal = 0;

                if (_intRetVal.Equals(0))
                {
                    DAL.FoodIntakeLog oFoodIntakeLogDAL = new FoodIntakeLog();
                    oFoodIntakeLogDAL.strUserId = oFoodIntakeInfo.StrUserId;
                    oFoodIntakeLogDAL.dtFoodIntakeDate = oFoodIntakeInfo.DtFoodIntakeDate;
                    oFoodIntakeLogDAL.intCalorie = oFoodIntakeInfo.IntCalorie;
                    oFoodIntakeLogDAL.strMilkDetails = oFoodIntakeInfo.StrMilkDetails;
                    oFoodIntakeLogDAL.strFruitDetails = oFoodIntakeInfo.StrFruitDetails;
                    oFoodIntakeLogDAL.strVegetablesDetails = oFoodIntakeInfo.StrVegetablesDetails;
                    oFoodIntakeLogDAL.strStarchDetails = oFoodIntakeInfo.StrStarchDetails;
                    oFoodIntakeLogDAL.strProteinDetails = oFoodIntakeInfo.StrProteinDetails;
                    oFoodIntakeLogDAL.strFATDetails = oFoodIntakeInfo.StrFATDetails;
                    oFoodIntakeLogDAL.strWaterDetails = oFoodIntakeInfo.StrWaterDetails;
                    oFoodIntakeLogDAL.chrIsDeleted = 'N';
                    oFoodIntakeLogDAL.dtCreatedOn = DateTime.Now;
                    _db.FoodIntakeLogs.InsertOnSubmit(oFoodIntakeLogDAL);

                    _db.SubmitChanges();
                    // _intRetVal = oFoodIntakeLogDAL.intFoodIntakeLogId;

                    oFoodIntakeInfo = null;

                    oFoodIntakeLogDAL = null;
                }


                return _intRetVal;
            }
        }

        #endregion

        #region Insert Functions

        /// Function Header*******************************************************
        /// Function Name: GetFoodIntakeDetailsByUserId
        /// Function Type: Function
        /// Functionality: used to get the food intake details by userid
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.FoodIntakeInfo> GetFoodIntakeDetailsByUserId(string _strUserId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                return (from _fi in _db.FoodIntakeLogs
                        where _fi.strUserId.ToLower().Equals(_strUserId.ToLower())
                        && _fi.chrIsDeleted.Equals('N')
                        select new Entity.FoodIntakeInfo()
                        {
                            IntFoodIntakeLogId = _fi.intFoodIntakeLogId,
                            DtCreatedOn = _fi.dtCreatedOn ?? DateTime.Now,
                            DtFoodIntakeDate = _fi.dtFoodIntakeDate ?? DateTime.Now,
                            IntCalorie = _fi.intCalorie ?? 0,
                            StrFATDetails = _fi.strFATDetails,
                            StrFruitDetails = _fi.strFruitDetails,
                            StrMilkDetails = _fi.strMilkDetails,
                            StrProteinDetails = _fi.strProteinDetails,
                            StrStarchDetails = _fi.strStarchDetails,
                            StrUserId = _fi.strUserId,
                            StrVegetablesDetails = _fi.strVegetablesDetails,
                            StrWaterDetails = _fi.strWaterDetails
                        }).ToList();
            }
        }

        #endregion
    }
}
