using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;

namespace BLL
{
    public class LibraryLib
    {
        #region Insert Functions

        /// Function Header*******************************************************
        /// Function Name: SaveLibraryDetails
        /// Function Type: Function
        /// Functionality: used to save the details of library
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int SaveLibraryDetails(Entity.LibraryInfo oLibraryInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 0;

                var _varChkDuplicate = _db.Libraries.Where(x => x.strTitle.ToLower().Equals(oLibraryInfo.StrTitle.ToLower())
                                                                                                                    )

                    .FirstOrDefault();
                bool blnIsLibraryExists = false;
                if (_varChkDuplicate != null)
                {
                    string strOldDate = _varChkDuplicate.dtCreatedDate.ToShortDateString();
                    if (strOldDate.Equals(oLibraryInfo.DtCreatedDate.ToShortDateString()))
                    {
                        blnIsLibraryExists = true;
                    }
                }

                if (!blnIsLibraryExists)
                {
                    DAL.Library oLibraryDAL = new Library();

                    oLibraryDAL.strTitle = oLibraryInfo.StrTitle;
                    oLibraryDAL.strDescription = oLibraryInfo.StrDescription;
                    oLibraryDAL.strCategory = oLibraryInfo.StrCategory;
                    oLibraryDAL.strLocation = oLibraryInfo.StrLocation;
                    oLibraryDAL.strLocationType = oLibraryInfo.StrLocationType;
                    oLibraryDAL.dtLibraryDate = oLibraryInfo.DtLibraryDate;
                    oLibraryDAL.dtCreatedDate = oLibraryInfo.DtCreatedDate;
                    oLibraryDAL.chrIsActive = oLibraryInfo.ChrIsActive;
                    oLibraryDAL.chrIsDeleted = oLibraryInfo.ChrIsDeleted;
                    oLibraryDAL.dtDeletedDate = oLibraryInfo.DtDeletedDate;
                    oLibraryDAL.dtModifiedDate = oLibraryInfo.DtModifiedDate;
                    _db.Libraries.InsertOnSubmit(oLibraryDAL);
                    _db.SubmitChanges();

                    intRetVal = oLibraryDAL.intLibraryId;
                    oLibraryDAL = null;
                }


                oLibraryInfo = null;
                return intRetVal;
            }
        }

        #endregion

        #region Update Functions

        /// Function Header*******************************************************
        /// Function Name: UpdateLibraryDetails
        /// Function Type: Function
        /// Functionality: used to update the details of library
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int UpdateLibraryDetails(Entity.LibraryInfo oLibraryInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 0;
                DAL.Library oLibraryDAL = _db.Libraries.Where(x => x.intLibraryId.Equals(oLibraryInfo.IntLibraryId)).FirstOrDefault();
                oLibraryDAL.strTitle = oLibraryInfo.StrTitle;
                oLibraryDAL.strDescription = oLibraryInfo.StrDescription;
                oLibraryDAL.strCategory = oLibraryInfo.StrCategory;
                oLibraryDAL.strLocation = oLibraryInfo.StrLocation;
                oLibraryDAL.strLocationType = oLibraryInfo.StrLocationType;
                oLibraryDAL.dtLibraryDate = oLibraryInfo.DtLibraryDate;
                oLibraryDAL.dtCreatedDate = oLibraryInfo.DtCreatedDate;
                oLibraryDAL.chrIsActive = oLibraryInfo.ChrIsActive;
                oLibraryDAL.chrIsDeleted = oLibraryInfo.ChrIsDeleted;
                oLibraryDAL.dtDeletedDate = oLibraryInfo.DtDeletedDate;
                oLibraryDAL.dtModifiedDate = oLibraryInfo.DtModifiedDate;
                _db.SubmitChanges();

                intRetVal = oLibraryDAL.intLibraryId;

                oLibraryDAL = null;
                oLibraryInfo = null;
                return intRetVal;
            }
        }


        /// Function Header*******************************************************
        /// Function Name: DeleteLibraryDetails
        /// Function Type: Function
        /// Functionality: used to delete the details 
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void DeleteLibraryDetails(int _intLibraryId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var oVarObj = _db.Libraries.Where(x => x.intLibraryId.Equals(_intLibraryId)
                                   ).SingleOrDefault();
                if (oVarObj != null)
                {
                    oVarObj.chrIsDeleted = 'Y';
                    oVarObj.dtDeletedDate = DateTime.Now;
                    _db.SubmitChanges();
                    oVarObj = null;
                }
            }
        }

        /// Function Header*******************************************************
        /// Function Name: ActivateDeactivateLibrary
        /// Function Type: Function
        /// Functionality: used to update the activation and deactivation 
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void ActivateDeactivateLibrary(int _intLibraryId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var oVarObj = _db.Libraries.Where(x => x.intLibraryId.Equals(_intLibraryId)
                                   ).SingleOrDefault();
                if (oVarObj != null)
                {
                    oVarObj.chrIsActive = oVarObj.chrIsActive.Equals('Y') ? 'N' : 'Y';
                    oVarObj.dtModifiedDate = DateTime.Now;
                    _db.SubmitChanges();
                    oVarObj = null;
                }
            }
        }

        #endregion

        #region Bind Functions

        /// Function Header*******************************************************
        /// Function Name: GetAllEvents
        /// Function Type: Function
        /// Functionality: used to get the details
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.LibraryInfo> GetAllLibraries()
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                return (from _q in _db.Libraries
                        where _q.chrIsDeleted.Equals('N')
                        orderby _q.dtModifiedDate descending
                        select new Entity.LibraryInfo()
                        {
                            IntLibraryId = _q.intLibraryId,
                            StrTitle = _q.strTitle,
                            StrDescription = _q.strDescription,
                            StrCategory = _q.strCategory,
                            StrLocation = _q.strLocation,
                            StrLocationType = _q.strLocationType,
                            DtLibraryDate = _q.dtLibraryDate ?? DateTime.Now,
                            DtCreatedDate = _q.dtCreatedDate,
                            DtModifiedDate = _q.dtModifiedDate,
                            ChrIsActive = _q.chrIsActive ?? 'Y'
                        }).ToList();
            }
        }


        /// Function Header*******************************************************
        /// Function Name: GetEventByEventId
        /// Function Type: Function
        /// Functionality: used to get the details  by id
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public Entity.LibraryInfo GetLibraryByLibraryId(int _intLibraryId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                return (from _q in _db.Libraries
                        where _q.chrIsDeleted.Equals('N')
                        && _q.intLibraryId.Equals(_intLibraryId)
                        select new Entity.LibraryInfo()
                        {
                            IntLibraryId = _q.intLibraryId,
                            StrTitle = _q.strTitle,
                            StrDescription = _q.strDescription,
                            StrCategory = _q.strCategory,
                            StrLocation = _q.strLocation,
                            StrLocationType = _q.strLocationType,
                            DtLibraryDate = _q.dtLibraryDate ?? DateTime.Now,
                            DtCreatedDate = _q.dtCreatedDate,
                            DtModifiedDate = _q.dtModifiedDate,
                            ChrIsActive = _q.chrIsActive ?? 'Y'
                        }).FirstOrDefault();
            }
        }


        /// Function Header*******************************************************
        /// Function Name: GetEventByEventId
        /// Function Type: Function
        /// Functionality: used to get the details  by id
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.EventInfo> GetEventByUserId(string _strUserName)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                return (from _q in _db.Events
                        where _q.chrIsDeleted.Equals('N')
                        && _q.strUserName.Equals(_strUserName)
                        orderby _q.dtModifiedOn descending
                        select new Entity.EventInfo()
                        {
                            IntEventsId = _q.intEventsId,
                            StrUserName = _q.strUserName,
                            DtEventDate = _q.dtEventDate,
                            StrActivity = _q.strActivity,
                            StrLocation = _q.strLocation,
                            StrComments = _q.strComments,
                            ChrStatus = _q.chrStatus,
                            DtCreatedOn = _q.dtCreatedOn ?? DateTime.Now,
                            ChrIsActive = _q.chrIsActive ?? 'Y'
                        }).ToList();
            }
        }
        #endregion
    }
}
