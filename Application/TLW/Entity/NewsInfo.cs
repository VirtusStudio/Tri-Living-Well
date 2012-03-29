using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class NewsInfo
    {
        
        #region  NEWS INFO PRIVATE MEMBER DECLARATION

        private int _intNewsAnnouncementsId;
        private int _intNewsLetterId;
        private string _strTitle;
        private string _strAddRemoveFromFavorite;

        private DateTime _strNewsletterDate;

        private string _strHeading;
        private string _strDescription;
        private string _strPDFFilename;
        private string _strDirectLink;
        private char _chrIsHomePage;
        private char _chrIsActive;
        private char _chrIsDelelte;
        private DateTime _dtCreatedOn;
        private DateTime _dtModifiedOn;
        private DateTime _dtDeletedOn;

        private string _addRemoveFromFavorite;

        private int _intFavoriteId;

        private string _strUserId;

        private string _strFavoriteType;

        private int _intFavoriteTypeId;

      
        #endregion

        #region NEWS INFO PROPERTY DECLARATION
      
        public string AddRemoveFromFavorite
        {
            get { return _addRemoveFromFavorite; }
            set { _addRemoveFromFavorite = value; }
        }

        public DateTime StrNewsletterDate
        {
            get { return _strNewsletterDate; }
            set { _strNewsletterDate = value; }
        }
        public string StrTitle
        {
            get { return _strTitle; }
            set { _strTitle = value; }
        }

        public int IntNewsLetterId
        {
            get { return _intNewsLetterId; }
            set { _intNewsLetterId = value; }
        }

        public DateTime DtDeletedOn
        {
            get { return _dtDeletedOn; }
            set { _dtDeletedOn = value; }
        }


        public DateTime DtModifiedOn
        {
            get { return _dtModifiedOn; }
            set { _dtModifiedOn = value; }
        }


        public DateTime DtCreatedOn
        {
            get { return _dtCreatedOn; }
            set { _dtCreatedOn = value; }
        }

        public char ChrIsDelelte
        {
            get { return _chrIsDelelte; }
            set { _chrIsDelelte = value; }
        }

        public char ChrIsActive
        {
            get { return _chrIsActive; }
            set { _chrIsActive = value; }
        }


        public char ChrIsHomePage
        {
            get { return _chrIsHomePage; }
            set { _chrIsHomePage = value; }
        }


        public string StrPDFFilename
        {
            get { return _strPDFFilename; }
            set { _strPDFFilename = value; }
        }

        public string StrDescription
        {
            get { return _strDescription; }
            set { _strDescription = value; }
        }


        public string StrHeading
        {
            get { return _strHeading; }
            set { _strHeading = value; }
        }

        public int IntNewsAnnouncementsId
        {
            get { return _intNewsAnnouncementsId; }
            set { _intNewsAnnouncementsId = value; }
        }

        public string StrDirectLink
        {
            get { return _strDirectLink; }
            set { _strDirectLink = value; }
        }


        public string StrAddRemoveFromFavorite
        {
            get { return _strAddRemoveFromFavorite; }
            set { _strAddRemoveFromFavorite = value; }
        }



        public int IntFavoriteTypeId
        {
            get { return _intFavoriteTypeId; }
            set { _intFavoriteTypeId = value; }
        }

        public string StrFavoriteType
        {
            get { return _strFavoriteType; }
            set { _strFavoriteType = value; }
        }

        public string StrUserId
        {
            get { return _strUserId; }
            set { _strUserId = value; }
        }

        public int IntFavoriteId
        {
            get { return _intFavoriteId; }
            set { _intFavoriteId = value; }
        }

        #endregion

    }
}
