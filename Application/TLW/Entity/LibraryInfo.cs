using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
   public class LibraryInfo
   {
      
       #region  LIBRARY INFO PRIVATE MEMBER DECLARATION

       private int _intLibraryId;
       private string _strTitle;
       private string _strDescription;
       private string _strCategory;
       private string _strLocation;
       private string _strLocationType;
       private DateTime _dtLibraryDate;
       private DateTime _dtCreatedDate;
       private char _chrIsActive;
       private char _chrIsDeleted;
       private DateTime _dtDeletedDate;
       private DateTime _dtModifiedDate;


       #endregion

       #region LIBRARY INFO PROPERTY DECLARATION

       public DateTime DtModifiedDate
       {
           get { return _dtModifiedDate; }
           set { _dtModifiedDate = value; }
       }

       public DateTime DtDeletedDate
       {
           get { return _dtDeletedDate; }
           set { _dtDeletedDate = value; }
       }

       public char ChrIsDeleted
       {
           get { return _chrIsDeleted; }
           set { _chrIsDeleted = value; }
       }

       public char ChrIsActive
       {
           get { return _chrIsActive; }
           set { _chrIsActive = value; }
       }

       public DateTime DtCreatedDate
       {
           get { return _dtCreatedDate; }
           set { _dtCreatedDate = value; }
       }


       public DateTime DtLibraryDate
       {
           get { return _dtLibraryDate; }
           set { _dtLibraryDate = value; }
       }

       public string StrLocationType
       {
           get { return _strLocationType; }
           set { _strLocationType = value; }
       }

       public string StrLocation
       {
           get { return _strLocation; }
           set { _strLocation = value; }
       }


       public string StrCategory
       {
           get { return _strCategory; }
           set { _strCategory = value; }
       }


       public string StrDescription
       {
           get { return _strDescription; }
           set { _strDescription = value; }
       }

       public string StrTitle
       {
           get { return _strTitle; }
           set { _strTitle = value; }
       }

       public int IntLibraryId
       {
           get { return _intLibraryId; }
           set { _intLibraryId = value; }
       }

       #endregion
   }
}
