using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
namespace BLL
{
    public class NewsLib
    {
        #region Insert Functions

        /// Function Header*******************************************************
        /// Function Name: SaveNewsAnnouncements
        /// Function Type: Function
        /// Functionality: used to save the details of news and announcements
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int SaveNewsAnnouncements(Entity.NewsInfo oNewsInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 1;
                var _varDup = _db.NewsandAnnouncements.Where(x => x.strHeading.ToLower().Equals(oNewsInfo.StrHeading.ToLower())
                                       && x.chrIsDelelte.Equals('N')
                                   ).SingleOrDefault();
                if (_varDup != null)
                {
                    intRetVal = -1;
                    oNewsInfo = null;
                    _varDup = null;
                }
                else
                {

                    DAL.NewsandAnnouncement oNewsandAnnouncementDAL = new NewsandAnnouncement();
                    oNewsandAnnouncementDAL.strHeading = oNewsInfo.StrHeading;
                    oNewsandAnnouncementDAL.chrIsDelelte = 'N';
                    oNewsandAnnouncementDAL.chrIsActive = oNewsInfo.ChrIsActive;
                    oNewsandAnnouncementDAL.chrIsHomePage = oNewsInfo.ChrIsHomePage;
                    oNewsandAnnouncementDAL.dtCreatedOn = oNewsInfo.DtCreatedOn;
                    oNewsandAnnouncementDAL.dtModifiedOn = oNewsInfo.DtCreatedOn;
                    oNewsandAnnouncementDAL.strDescription = oNewsInfo.StrDescription;
                    oNewsandAnnouncementDAL.strHeading = oNewsInfo.StrHeading;

                    if (oNewsInfo.StrPDFFilename.Equals(string.Empty))
                        oNewsandAnnouncementDAL.strPDFFilename = "na.pdf";
                    else
                        oNewsandAnnouncementDAL.strPDFFilename = oNewsInfo.StrPDFFilename;



                    oNewsandAnnouncementDAL.strDirectLink = oNewsInfo.StrDirectLink;
                    _db.NewsandAnnouncements.InsertOnSubmit(oNewsandAnnouncementDAL);
                    _db.SubmitChanges();

                    intRetVal = oNewsandAnnouncementDAL.intNewsAnnouncementsId;
                    oNewsandAnnouncementDAL = null;
                    oNewsInfo = null;
                }


                return intRetVal;
            }

        }



        /// Function Header*******************************************************
        /// Function Name: SaveNewsletter
        /// Function Type: Function
        /// Functionality: used to save the details of newsletters
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int SaveNewsletter(Entity.NewsInfo oNewsInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 1;
                var _varDup = _db.Newsletters.Where(x => x.strTitle.ToLower().Equals(oNewsInfo.StrTitle.ToLower())
                                       && x.chrIsDeleted.Equals('N')
                                   ).SingleOrDefault();
                if (_varDup != null)
                {
                    intRetVal = -1;
                    oNewsInfo = null;
                    _varDup = null;
                }
                else
                {
                    DAL.Newsletter oNewslettersDAL = new Newsletter();
                    oNewslettersDAL.strTitle = oNewsInfo.StrTitle;
                    oNewslettersDAL.chrIsDeleted = 'N';
                    oNewslettersDAL.chrIsActive = oNewsInfo.ChrIsActive;
                    if (!oNewsInfo.StrNewsletterDate.ToString().Equals("1/1/1999 12:00:00 AM"))
                        oNewslettersDAL.strNewsletterDate = oNewsInfo.StrNewsletterDate;

                    oNewslettersDAL.dtCreatedOn = oNewsInfo.DtCreatedOn;
                    oNewslettersDAL.dtModifiedOn = oNewsInfo.DtCreatedOn;
                    oNewslettersDAL.strDescription = oNewsInfo.StrDescription;

                    if (oNewsInfo.StrPDFFilename.Equals(string.Empty))
                        oNewslettersDAL.strPDFFileName = "na.pdf";
                    else
                        oNewslettersDAL.strPDFFileName = oNewsInfo.StrPDFFilename;

                    _db.Newsletters.InsertOnSubmit(oNewslettersDAL);
                    _db.SubmitChanges();

                    intRetVal = oNewslettersDAL.intNewsLetterId;
                    oNewslettersDAL = null;
                    oNewsInfo = null;
                }


                return intRetVal;
            }
        }

        #endregion

        #region Update Functions

        /// Function Header*******************************************************
        /// Function Name: UpdateNewsAnnouncements
        /// Function Type: Function
        /// Functionality: used to save the details of news and announcements
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int UpdateNewsAnnouncements(Entity.NewsInfo oNewsInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 1;
                var _varDup = _db.NewsandAnnouncements.Where(x => x.strHeading.ToLower().Equals(oNewsInfo.StrHeading.ToLower())
                                       && x.chrIsDelelte.Equals('N')
                                       && !x.intNewsAnnouncementsId.Equals(oNewsInfo.IntNewsAnnouncementsId)
                                   ).SingleOrDefault();
                if (_varDup != null)
                {
                    intRetVal = -1;
                    oNewsInfo = null;
                    _varDup = null;
                }
                else
                {
                    _varDup = _db.NewsandAnnouncements.Where(x => x.intNewsAnnouncementsId.Equals(oNewsInfo.IntNewsAnnouncementsId)
                                                           ).FirstOrDefault();
                    if (_varDup != null)
                    {
                        _varDup.strHeading = oNewsInfo.StrHeading;
                        _varDup.chrIsActive = oNewsInfo.ChrIsActive;
                        _varDup.chrIsHomePage = oNewsInfo.ChrIsHomePage;
                        _varDup.dtModifiedOn = oNewsInfo.DtCreatedOn;
                        _varDup.strDescription = oNewsInfo.StrDescription;
                        _varDup.strHeading = oNewsInfo.StrHeading;


                        if (oNewsInfo.StrPDFFilename.Equals(string.Empty))
                            _varDup.strPDFFilename = "na.pdf";
                        else
                            _varDup.strPDFFilename = oNewsInfo.StrPDFFilename;


                        _varDup.strDirectLink = oNewsInfo.StrDirectLink;
                        _db.SubmitChanges();
                    }


                    intRetVal = _varDup.intNewsAnnouncementsId;
                    _varDup = null;
                    oNewsInfo = null;
                }

                return intRetVal;
            }
        }

        /// Function Header*******************************************************
        /// Function Name: SaveNewsletter
        /// Function Type: Function
        /// Functionality: used to save the details of newsletters
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int UpdateNewsletter(Entity.NewsInfo oNewsInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 1;
                var _varDup = _db.Newsletters.Where(x => x.strTitle.ToLower().Equals(oNewsInfo.StrTitle.ToLower())
                                       && x.chrIsDeleted.Equals('N')
                                       && !x.intNewsLetterId.Equals(oNewsInfo.IntNewsLetterId)
                                   ).SingleOrDefault();
                if (_varDup != null)
                {
                    intRetVal = -1;
                    oNewsInfo = null;
                    _varDup = null;
                }
                else
                {
                    _varDup = _db.Newsletters.Where(x => x.intNewsLetterId.Equals(oNewsInfo.IntNewsLetterId)
                                    ).SingleOrDefault();

                    _varDup.strTitle = oNewsInfo.StrTitle;

                    _varDup.chrIsActive = oNewsInfo.ChrIsActive;
                    if (!oNewsInfo.StrNewsletterDate.ToString().Equals("1/1/1999 12:00:00 AM"))
                        _varDup.strNewsletterDate = oNewsInfo.StrNewsletterDate;


                    _varDup.dtModifiedOn = oNewsInfo.DtCreatedOn;
                    _varDup.strDescription = oNewsInfo.StrDescription;
                    if (oNewsInfo.StrPDFFilename.Equals(string.Empty))
                        _varDup.strPDFFileName = "na.pdf";
                    else
                        _varDup.strPDFFileName = oNewsInfo.StrPDFFilename;

                    _db.SubmitChanges();
                    intRetVal = _varDup.intNewsLetterId;
                    _varDup = null;
                    oNewsInfo = null;
                }

                return intRetVal;
            }

        }


        /// Function Header*******************************************************
        /// Function Name: DeleteNewsAnnouncements
        /// Function Type: Function
        /// Functionality: used to save the details of news and announcements
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void DeleteNewsAnnouncements(int _intNewsAnnouncementsId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {

                var _varDup = _db.NewsandAnnouncements.Where(x => x.intNewsAnnouncementsId.Equals(_intNewsAnnouncementsId)
                                   ).SingleOrDefault();
                if (_varDup != null)
                {
                    _varDup.chrIsDelelte = 'Y';
                    _varDup.dtDeletedOn = DateTime.Now;
                    _db.SubmitChanges();

                    _varDup = null;
                }
            }
        }


        /// Function Header*******************************************************
        /// Function Name: SaveNewsletter
        /// Function Type: Function
        /// Functionality: used to save the details of newsletters
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void DeleteNewsletter(int _intNewsLetterId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varDup = _db.Newsletters.Where(x => x.intNewsLetterId.Equals(_intNewsLetterId)
                                   ).SingleOrDefault();
                if (_varDup != null)
                {
                    _varDup.chrIsDeleted = 'Y';
                    _varDup.dtDeletedOn = DateTime.Now;
                    _db.SubmitChanges();
                }
            }
        }


        /// Function Header*******************************************************
        /// Function Name: SaveNewsletter
        /// Function Type: Function
        /// Functionality: used to save the details of newsletters
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void UpdateNewsletterStatus(int _intNewsLetterId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varDup = _db.Newsletters.Where(x => x.intNewsLetterId.Equals(_intNewsLetterId)
                                   ).FirstOrDefault();
                if (_varDup != null)
                {
                    _varDup.chrIsActive = _varDup.chrIsActive.Equals('Y') ? 'N' : 'Y';
                    _varDup.dtModifiedOn = DateTime.Now;
                    _db.SubmitChanges();
                    _varDup = null;
                }
            }
        }


        /// Function Header*******************************************************
        /// Function Name: DeleteNewsAnnouncements
        /// Function Type: Function
        /// Functionality: used to save the details of news and announcements
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void UpdateNewsAnnouncementsStatus(int _intNewsAnnouncementsId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {

                var _varDup = _db.NewsandAnnouncements.Where(x => x.intNewsAnnouncementsId.Equals(_intNewsAnnouncementsId)
                                   ).SingleOrDefault();
                if (_varDup != null)
                {
                    _varDup.chrIsActive = _varDup.chrIsActive.Equals('Y') ? 'N' : 'Y';
                    _varDup.dtModifiedOn = DateTime.Now;
                    _db.SubmitChanges();
                    _varDup = null;
                }
            }
        }

        #endregion

        #region Binding Functions

        /// Function Header*******************************************************
        /// Function Name: GetAllNewsAnnouncements
        /// Function Type: Function
        /// Functionality: used to get all the news and announcements
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.NewsInfo> GetAllNewsAnnouncements()
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _na in _db.NewsandAnnouncements
                                  where _na.chrIsDelelte.Equals('N')
                                  orderby _na.dtModifiedOn descending
                                  select new Entity.NewsInfo()
                                  {
                                      IntNewsAnnouncementsId = _na.intNewsAnnouncementsId,
                                      StrPDFFilename = _na.strPDFFilename,
                                      StrDescription = _na.strDescription ?? "",
                                      StrHeading = _na.strHeading,
                                      ChrIsActive = _na.chrIsActive ?? 'Y',
                                      ChrIsDelelte = _na.chrIsDelelte ?? 'N',
                                      ChrIsHomePage = _na.chrIsHomePage ?? 'Y',
                                      DtCreatedOn = _na.dtCreatedOn,
                                      DtModifiedOn = _na.dtModifiedOn ?? DateTime.Now,
                                      StrDirectLink = _na.strDirectLink ?? ""
                                  }).ToList();
                return _varRetVal;
            }
        }

        /// Function Header*******************************************************
        /// Function Name: GetAllNewsAnnouncements
        /// Function Type: Function
        /// Functionality: used to get all the news and announcements
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.NewsInfo> GetActiveNewsAnnouncements()
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _na in _db.NewsandAnnouncements
                                  where _na.chrIsDelelte.Equals('N')
                                  && _na.chrIsActive.Equals('Y')
                                  orderby _na.dtModifiedOn descending
                                  select new Entity.NewsInfo()
                                  {
                                      IntNewsAnnouncementsId = _na.intNewsAnnouncementsId,
                                      StrPDFFilename = _na.strPDFFilename,
                                      StrDescription = _na.strDescription ?? "",
                                      StrHeading = _na.strHeading,
                                      ChrIsActive = _na.chrIsActive ?? 'Y',
                                      ChrIsDelelte = _na.chrIsDelelte ?? 'N',
                                      ChrIsHomePage = _na.chrIsHomePage ?? 'Y',
                                      DtCreatedOn = _na.dtCreatedOn,
                                      DtModifiedOn = _na.dtModifiedOn ?? DateTime.Now,
                                      StrDirectLink = _na.strDirectLink ?? ""
                                  }).ToList();
                return _varRetVal;
            }
        }


        /// Function Header*******************************************************
        /// Function Name: GetAllNewsLetters
        /// Function Type: Function
        /// Functionality: used to get all the newsletters
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.NewsInfo> GetAllNewsLetters()
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _na in _db.Newsletters
                                  where _na.chrIsDeleted.Equals('N')
                                  orderby _na.dtModifiedOn descending
                                  select new Entity.NewsInfo()
                                  {
                                      IntNewsLetterId = _na.intNewsLetterId,
                                      StrPDFFilename = _na.strPDFFileName,
                                      StrDescription = _na.strDescription ?? "",
                                      StrTitle = _na.strTitle,
                                      ChrIsActive = _na.chrIsActive ?? 'Y',
                                      StrNewsletterDate = _na.strNewsletterDate ?? Convert.ToDateTime("01/01/1999"),
                                      DtCreatedOn = _na.dtCreatedOn,
                                      DtModifiedOn = _na.dtModifiedOn ?? DateTime.Now
                                  }).ToList();
                return _varRetVal;
            }
        }

        /// Function Header*******************************************************
        /// Function Name: GetAllNewsLetters
        /// Function Type: Function
        /// Functionality: used to get all the newsletters
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.NewsInfo> GetActiveNewsLetters()
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _na in _db.Newsletters
                                  where _na.chrIsDeleted.Equals('N')
                                  && _na.chrIsActive.Equals('Y')
                                  orderby _na.dtModifiedOn descending
                                  select new Entity.NewsInfo()
                                  {
                                      IntNewsLetterId = _na.intNewsLetterId,
                                      StrPDFFilename = _na.strPDFFileName,
                                      StrDescription = _na.strDescription ?? "",
                                      StrTitle = _na.strTitle,
                                      ChrIsActive = _na.chrIsActive ?? 'Y',
                                      StrNewsletterDate = _na.strNewsletterDate ?? Convert.ToDateTime("01/01/1999"),
                                      DtCreatedOn = _na.dtCreatedOn,
                                      DtModifiedOn = _na.dtModifiedOn ?? DateTime.Now
                                  }).ToList();
                return _varRetVal;
            }
        }

        /// Function Header*******************************************************
        /// Function Name: GetAllNewsLetters
        /// Function Type: Function
        /// Functionality: used to get all the newsletters
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.NewsInfo> GetUserFavoriteNewsLetters(string _strUserName ,string _strUserType)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _na in _db.ms_GetUserFavoriteNewsLEtters(_strUserName, _strUserType)
                                  select new Entity.NewsInfo()
                                  {
                                      IntNewsLetterId = _na.IntNewsLetterId,
                                      AddRemoveFromFavorite = _na.AddRemoveFromFavorite,
                                      StrTitle = _na.strTitle
                                      
                                      
                                  }).ToList();
                return _varRetVal;
            }
        }


        /// Function Header*******************************************************
        /// Function Name: GetAllNewsLetters
        /// Function Type: Function
        /// Functionality: used to get all the newsletters
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note:  
        /// *********************************************************************
        public List<Entity.NewsInfo> GetUserFavoriteLibrary(string _strUserName, string _strUserType)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _na in _db.ms_GetUserFavoriteLibrary(_strUserName, _strUserType)
                                  select new Entity.NewsInfo()
                                  {
                                      IntNewsLetterId = _na.IntNewsLetterId,
                                      AddRemoveFromFavorite = _na.AddRemoveFromFavorite,
                                      StrTitle = _na.strTitle
                                  }).ToList();
                return _varRetVal;
            }
        }


        /// Function Header*******************************************************
        /// Function Name: GetAllNewsLetters
        /// Function Type: Function
        /// Functionality: used to get all the newsletters
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note:  
        /// *********************************************************************
        public List<Entity.NewsInfo> GetUserFavoriteNewsAndAnnouncement(string _strUserName, string _strUserType)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _na in _db.ms_GetUserFavoriteNewsAnnouncements(_strUserName, _strUserType)
                                  select new Entity.NewsInfo()
                                  {
                                      IntNewsLetterId = _na.IntNewsLetterId,
                                      AddRemoveFromFavorite = _na.AddRemoveFromFavorite,
                                      StrTitle = _na.strTitle
                                  }).ToList();
                return _varRetVal;
            }
        }

        /// Function Header*******************************************************
        /// Function Name: GetFavoriteListByUserName
        /// Function Type: Function
        /// Functionality: used to get all the items in the favorite list.
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note:  
        /// *********************************************************************
        public List<Entity.NewsInfo> GetFavoriteListByUserName(string _strUserName, string _strUserType)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _na in _db.UserFavoriteDetails
                                  where _na.strUserId.ToLower().Equals(_strUserName.ToLower())
                                  orderby _na.dtCreatedOn descending
                                  select new Entity.NewsInfo()
                                  {
                                      IntFavoriteId = _na.intFavoriteId,
                                      IntFavoriteTypeId = _na.intFavoriteTypeId,
                                      StrTitle = _na.strTitle,
                                      DtCreatedOn = _na.dtCreatedOn,
                                      StrFavoriteType =_na.strFavoriteType
                                  }).ToList();
                return _varRetVal;
            }
        }

        /// Function Header*******************************************************
        /// Function Name: GetFavoriteListByUserName
        /// Function Type: Function
        /// Functionality: used to get all the items in the favorite list.
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note:  
        /// *********************************************************************
        public  Entity.NewsInfo  GetFavoriteListByFavoriteId(int _intFavoriteId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _na in _db.UserFavoriteDetails
                                  where _na.intFavoriteId.Equals(_intFavoriteId)
                                  orderby _na.dtCreatedOn descending
                                  select new Entity.NewsInfo()
                                  {
                                      IntFavoriteId = _na.intFavoriteId,
                                      IntFavoriteTypeId = _na.intFavoriteTypeId,
                                      StrTitle = _na.strTitle,
                                      DtCreatedOn = _na.dtCreatedOn,
                                      StrFavoriteType = _na.strFavoriteType
                                  }).SingleOrDefault();
                return _varRetVal;
            }
        }
        /// Function Header*******************************************************
        /// Function Name: GetAllNewsLetters
        /// Function Type: Function
        /// Functionality: used to get all the newsletters
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note:  
        /// *********************************************************************
        public List<Entity.NewsInfo> GetUserFavoriteEvents(string _strUserName, string _strUserType)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _na in _db.ms_GetUserFavoriteEvents(_strUserName, _strUserType)
                                  select new Entity.NewsInfo()
                                  {
                                      IntNewsLetterId = _na.IntNewsLetterId,
                                      AddRemoveFromFavorite = _na.AddRemoveFromFavorite,
                                      StrTitle = _na.strTitle
                                  }).ToList();
                return _varRetVal;
            }
        }
        /// Function Header*******************************************************
        /// Function Name: GetAllNewsLetters
        /// Function Type: Function
        /// Functionality: used to get all the newsletters
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public Entity.NewsInfo GetNewsLettersById(int _intNewsLetterId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _na in _db.Newsletters
                                  where _na.chrIsDeleted.Equals('N')
                                  && _na.intNewsLetterId.Equals(_intNewsLetterId)
                                  orderby _na.dtModifiedOn descending
                                  select new Entity.NewsInfo()
                                  {
                                      IntNewsLetterId = _na.intNewsLetterId,
                                      StrPDFFilename = _na.strPDFFileName,
                                      StrDescription = _na.strDescription ?? "",
                                      StrTitle = _na.strTitle,
                                      ChrIsActive = _na.chrIsActive ?? 'Y',
                                      StrNewsletterDate = _na.strNewsletterDate ?? Convert.ToDateTime("01/01/1999"),
                                      DtCreatedOn = _na.dtCreatedOn,
                                      DtModifiedOn = _na.dtModifiedOn ?? DateTime.Now
                                  }).FirstOrDefault();
                return _varRetVal;
            }
        }


        /// Function Header*******************************************************
        /// Function Name: GetAllNewsAnnouncements
        /// Function Type: Function
        /// Functionality: used to get all the news and announcements
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.NewsInfo> GetAllNewsAnnouncementsForHomePage()
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _na in _db.NewsandAnnouncements
                                  where _na.chrIsDelelte.Equals('N')
                                  &&_na.chrIsActive.Equals('Y')
                                  && _na.chrIsHomePage.Equals('Y')
                                  orderby _na.dtModifiedOn descending
                                  select new Entity.NewsInfo()
                                  {
                                      IntNewsAnnouncementsId = _na.intNewsAnnouncementsId,
                                      StrPDFFilename = _na.strPDFFilename,
                                      StrDescription = _na.strDescription ?? "",
                                      StrHeading = _na.strHeading,
                                      ChrIsActive = _na.chrIsActive ?? 'Y',
                                      ChrIsDelelte = _na.chrIsDelelte ?? 'N',
                                      ChrIsHomePage = _na.chrIsHomePage ?? 'Y',
                                      DtCreatedOn = _na.dtCreatedOn,
                                      DtModifiedOn = _na.dtModifiedOn ?? DateTime.Now,
                                      StrDirectLink = _na.strDirectLink??""
                                  }).ToList();
                return _varRetVal;
            }
        }

        /// Function Header*******************************************************
        /// Function Name: GetAllNewsAnnouncements
        /// Function Type: Function
        /// Functionality: used to get all the news and announcements
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public Entity.NewsInfo GetNewsAnnouncementsById(int _intNewsAndAnnouncementsId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varRetVal = (from _na in _db.NewsandAnnouncements
                                  where _na.chrIsDelelte.Equals('N')
                                  && _na.intNewsAnnouncementsId.Equals(_intNewsAndAnnouncementsId)
                                  select new Entity.NewsInfo()
                                  {
                                      IntNewsAnnouncementsId = _na.intNewsAnnouncementsId,
                                      StrPDFFilename = _na.strPDFFilename,
                                      StrDescription = _na.strDescription ?? "",
                                      StrHeading = _na.strHeading,
                                      ChrIsActive = _na.chrIsActive ?? 'Y',
                                      ChrIsDelelte = _na.chrIsDelelte ?? 'N',
                                      ChrIsHomePage = _na.chrIsHomePage ?? 'Y',
                                      DtCreatedOn = _na.dtCreatedOn,
                                      DtModifiedOn = _na.dtModifiedOn ?? DateTime.Now,
                                      StrDirectLink = _na.strDirectLink ?? ""
                                  }).FirstOrDefault();
                return _varRetVal;
            }
        }


        #endregion

    }
}
