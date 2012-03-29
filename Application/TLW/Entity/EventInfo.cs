using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
   public class EventInfo
   {

       #region  EVENTS INFO PRIVATE MEMBER DECLARATION

       private int _intEventsId;
       private int _intUserId;
       private DateTime _dtEventDate;
       private string _strActivity;
       private string _strLocation;
       private string _strComments;
       private char _chrStatus;
       private char _chrIsDeleted;
       private char _chrIsActive;
       private DateTime _dtCreatedOn;
       
       private DateTime _dtDeletedOn;
       private DateTime _dtModifiedOn;
       private Guid _strUserID;

       private string _strUserName;

       #endregion

       #region EVENTS INFO PROPERTY DECLARATION



       public string StrUserName
       {
           get { return _strUserName; }
           set { _strUserName = value; }
       }

       public Guid StrUserID
       {
           get { return _strUserID; }
           set { _strUserID = value; }
       }

       public DateTime DtModifiedOn
       {
           get { return _dtModifiedOn; }
           set { _dtModifiedOn = value; }
       }

       public DateTime DtDeletedOn
       {
           get { return _dtDeletedOn; }
           set { _dtDeletedOn = value; }
       }

       public char ChrIsDeleted
       {
           get { return _chrIsDeleted; }
           set { _chrIsDeleted = value; }
       }

       public DateTime DtCreatedOn
       {
           get { return _dtCreatedOn; }
           set { _dtCreatedOn = value; }
       }


       public char ChrStatus
       {
           get { return _chrStatus; }
           set { _chrStatus = value; }
       }

       public string StrComments
       {
           get { return _strComments; }
           set { _strComments = value; }
       }

       public string StrLocation
       {
           get { return _strLocation; }
           set { _strLocation = value; }
       }

       public string StrActivity
       {
           get { return _strActivity; }
           set { _strActivity = value; }
       }

       public DateTime DtEventDate
       {
           get { return _dtEventDate; }
           set { _dtEventDate = value; }
       }

       public int IntUserId
       {
           get { return _intUserId; }
           set { _intUserId = value; }
       }


       public int IntEventsId
       {
           get { return _intEventsId; }
           set { _intEventsId = value; }
       }



       public char ChrIsActive
       {
           get { return _chrIsActive; }
           set { _chrIsActive = value; }
       }
       
       #endregion

   }
}
