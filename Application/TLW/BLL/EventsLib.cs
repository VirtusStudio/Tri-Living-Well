using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
namespace BLL
{
    public class EventsLib
    {
        #region Insert Functions

        /// Function Header*******************************************************
        /// Function Name: SaveEventDetails
        /// Function Type: Function
        /// Functionality: used to save the details of event
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int SaveEventDetails(Entity.EventInfo oEventInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 0;
                DAL.Event oEventDAL = new Event();
                oEventDAL.strUserName = oEventInfo.StrUserName;
                oEventDAL.dtEventDate = oEventInfo.DtEventDate;
                oEventDAL.strActivity = oEventInfo.StrActivity;
                oEventDAL.strLocation = oEventInfo.StrLocation;
                oEventDAL.strComments = oEventInfo.StrComments;
                oEventDAL.chrStatus = oEventInfo.ChrStatus;
                oEventDAL.dtCreatedOn = oEventInfo.DtCreatedOn;
                oEventDAL.chrIsDeleted = oEventInfo.ChrIsDeleted;
                oEventDAL.chrIsActive = oEventInfo.ChrIsActive;
                oEventDAL.dtModifiedOn = oEventInfo.DtCreatedOn;
                _db.Events.InsertOnSubmit(oEventDAL);
                _db.SubmitChanges();

                intRetVal = oEventDAL.intEventsId;
                oEventDAL = null;
                oEventInfo = null;
                return intRetVal;
            }
        }

        #endregion

        #region Update Functions

        /// Function Header*******************************************************
        /// Function Name: UpdateEventDetails
        /// Function Type: Function
        /// Functionality: used to update the details of event
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public int UpdateEventDetails(Entity.EventInfo oEventInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                int intRetVal = 0;
                DAL.Event oEventDAL = _db.Events.Where(x => x.intEventsId.Equals(oEventInfo.IntEventsId)).FirstOrDefault();
                oEventDAL.dtEventDate = oEventInfo.DtEventDate;
                oEventDAL.strActivity = oEventInfo.StrActivity;
                oEventDAL.strLocation = oEventInfo.StrLocation;
                oEventDAL.strComments = oEventInfo.StrComments;
                oEventDAL.chrStatus = oEventInfo.ChrStatus;
                oEventDAL.dtModifiedOn = oEventInfo.DtCreatedOn;
                oEventDAL.chrIsActive = oEventInfo.ChrIsActive;
                _db.SubmitChanges();

                intRetVal = oEventDAL.intEventsId;
                oEventDAL = null;
                oEventInfo = null;
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
        public void DeleteEventDetails(int _intEventdId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var oVarObj = _db.Events.Where(x => x.intEventsId.Equals(_intEventdId)
                                   ).SingleOrDefault();
                if (oVarObj != null)
                {
                    oVarObj.chrIsDeleted = 'Y';
                    oVarObj.dtDeletedOn = DateTime.Now;
                    _db.SubmitChanges();
                    oVarObj = null;
                }
            }
        }

        /// Function Header*******************************************************
        /// Function Name: ActivateDeactivateEvent
        /// Function Type: Function
        /// Functionality: used to update the activation and deactivation 
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void ActivateDeactivateEvent(int _intEventId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var oVarObj = _db.Events.Where(x => x.intEventsId.Equals(_intEventId)
                                   ).SingleOrDefault();
                if (oVarObj != null)
                {
                    oVarObj.chrIsActive = oVarObj.chrIsActive.Equals('Y') ? 'N' : 'Y';
                    oVarObj.dtModifiedOn = DateTime.Now;
                    _db.SubmitChanges();
                    oVarObj = null;
                }
            }
        }


        /// Function Header*******************************************************
        /// Function Name: ActivateDeactivateEvent
        /// Function Type: Function
        /// Functionality: used to update the activation and deactivation 
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public void ApproveDisapproveEvent(int _intEventId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var oVarObj = _db.Events.Where(x => x.intEventsId.Equals(_intEventId)
                                   ).SingleOrDefault();
                if (oVarObj != null)
                {
                    oVarObj.chrStatus = oVarObj.chrStatus.Equals('A') ? 'D' : 'A';
                    oVarObj.dtModifiedOn = DateTime.Now;
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
        public List<Entity.EventInfo> GetAllEvents()
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                return (from _q in _db.Events
                        where _q.chrIsDeleted.Equals('N')
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
                            ChrIsActive = _q.chrIsActive ?? 'Y'
                        }).ToList();
            }
        }


        /// Function Header*******************************************************
        /// Function Name: GetAllEvents
        /// Function Type: Function
        /// Functionality: used to get the details
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public List<Entity.EventInfo> SearchEvents(char _chrStatus, string _strUserName)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varEvents = (from _q in _db.Events
                                  where _q.chrIsDeleted.Equals('N')
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
                                      ChrIsActive = _q.chrIsActive ?? 'Y',
                                      DtCreatedOn = _q.dtCreatedOn ?? DateTime.Now
                                  }).ToList();
                var _varRetObj = _varEvents;
                if (_chrStatus.Equals('A') || _chrStatus.Equals('D'))
                    _varRetObj = _varRetObj.Where(x => x.ChrStatus.Equals(_chrStatus)).ToList();
                if (_chrStatus.Equals('Y') || _chrStatus.Equals('N'))
                    _varRetObj = _varRetObj.Where(x => x.ChrIsActive.Equals(_chrStatus)).ToList();

                if (!_strUserName.ToString().Equals("0"))
                    _varRetObj = _varRetObj.Where(x => x.StrUserName.Equals(_strUserName)).ToList();

                return _varRetObj;

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
        public Entity.EventInfo GetEventByEventId(int _intEventId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                return (from _q in _db.Events
                        where _q.chrIsDeleted.Equals('N')
                        && _q.intEventsId.Equals(_intEventId)
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

        public List<Entity.EventInfo> GetWellnessData(string _strUserName)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                //var result = from customer in _db.tbl_wellnessEntries
                //             where customer.UserName.Equals(_strUserName)
                //             select customer;

                //return result.ToList();


                return (from cust in _db.tbl_wellnessEntries
                        where cust.UserName.Equals(_strUserName)
                        select new Entity.EventInfo()
                        {
                            IntEventsId = cust.Id,
                            UserName = cust.UserName,
                            Sleep = Convert.ToInt32(cust.Sleep),
                            Stress = Convert.ToInt32(cust.Stress),
                            Outlook = Convert.ToInt32(cust.Outlook),
                            Engagement = Convert.ToInt32(cust.Engagement),
                            Energy = Convert.ToInt32(cust.Energy),
                            Day = cust.Day,
                            Dates = Convert.ToDateTime(cust.Dates)
                        }).ToList();
            }
        }
        #endregion
    }
}
