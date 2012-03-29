using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class TemplateInfo
    {
        #region  TEMPLATE INFO PRIVATE MEMBER DECLARATION

        private int _intContentPagesId;
        private string _strPageName;
        private string _strDefaultName;
        private int _intTemplateType;
        private int _intModifiedBy;

        private string _TextAreaHTML;
        private DateTime _dtModifedOn;




        #endregion

        #region TEMPLATE INFO PROPERTY DECLARATION


        public DateTime DtModifedOn
        {
            get { return _dtModifedOn; }
            set { _dtModifedOn = value; }
        }

        public string TextAreaHTML
        {
            get { return _TextAreaHTML; }
            set { _TextAreaHTML = value; }
        }

        public int IntModifiedBy
        {
            get { return _intModifiedBy; }
            set { _intModifiedBy = value; }
        }


        public int IntTemplateType
        {
            get { return _intTemplateType; }
            set { _intTemplateType = value; }
        }

        public string StrDefaultName
        {
            get { return _strDefaultName; }
            set { _strDefaultName = value; }
        }

        public string StrPageName
        {
            get { return _strPageName; }
            set { _strPageName = value; }
        }


        public int IntContentPagesId
        {
            get { return _intContentPagesId; }
            set { _intContentPagesId = value; }
        }

        #endregion
    }

    public class HotSectionDetailsInfo
    {
        #region  HotSectionDetails INFO PRIVATE DECLARATION

        private int _intHotSectionId;
        private string _strHeading;
        private string _strDescription;
        private string _strLink;
        private char _chrIsDeleted;
        private DateTime _dtCreatedOn;
        private DateTime _dtDeletedOn;
        private char _chrDisplayOnDashboard;
        private Guid _guidUserId;

        #endregion 

        #region  HotSectionDetails INFO PROPERTY DECLARATION


        public Guid GuidUserId
        {
            get { return _guidUserId; }
            set { _guidUserId = value; }
        }


        public char ChrDisplayOnDashboard
        {
            get { return _chrDisplayOnDashboard; }
            set { _chrDisplayOnDashboard = value; }
        }


        public DateTime DtDeletedOn
        {
            get { return _dtDeletedOn; }
            set { _dtDeletedOn = value; }
        }


        public DateTime DtCreatedOn
        {
            get { return _dtCreatedOn; }
            set { _dtCreatedOn = value; }
        }


        public char ChrIsDeleted
        {
            get { return _chrIsDeleted; }
            set { _chrIsDeleted = value; }
        }

        public string StrLink
        {
            get { return _strLink; }
            set { _strLink = value; }
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

        public int IntHotSectionId
        {
            get { return _intHotSectionId; }
            set { _intHotSectionId = value; }
        }



        #endregion
    }

    public class PersonalSummaryInfo
    {
        #region  PERSONAL SUMMARY INFO PRIVATE DECLARATION
        private int _intPersonalSummaryId;
        private decimal _decWeight;
        private decimal _decWaist;
        private decimal _decBMI;
        private decimal _decBodyFATPercentage;
        private decimal _decWaistToHeight;
        private decimal _decWaistToHip;
        private Guid _guidUserId;
        private DateTime _dtCreatedOn;
        private string _strGender;
        private string _strRatioType;
        private string _strRatioCode;
        private decimal _decFrom;
        private decimal _decTo;
        private string _strLevelofRisk;
        private DateTime _dtModifiedOn;


        #endregion

        #region  PERSONAL SUMMARY INFO PUBLIC DECLARATION



        public DateTime DtModifiedOn
        {
            get { return _dtModifiedOn; }
            set { _dtModifiedOn = value; }
        }

        public string StrLevelofRisk
        {
            get { return _strLevelofRisk; }
            set { _strLevelofRisk = value; }
        }

        public decimal DecTo
        {
            get { return _decTo; }
            set { _decTo = value; }
        }

        public decimal DecFrom
        {
            get { return _decFrom; }
            set { _decFrom = value; }
        }

        public string StrRatioCode
        {
            get { return _strRatioCode; }
            set { _strRatioCode = value; }
        }



        public string StrRatioType
        {
            get { return _strRatioType; }
            set { _strRatioType = value; }
        }


        public string StrGender
        {
            get { return _strGender; }
            set { _strGender = value; }
        }

        public DateTime DtCreatedOn
        {
            get { return _dtCreatedOn; }
            set { _dtCreatedOn = value; }
        }

        public Guid GuidUserId
        {
            get { return _guidUserId; }
            set { _guidUserId = value; }
        }

        public decimal DecWaistToHip
        {
            get { return _decWaistToHip; }
            set { _decWaistToHip = value; }
        }

        public decimal DecWaistToHeight
        {
            get { return _decWaistToHeight; }
            set { _decWaistToHeight = value; }
        }

        public decimal DecBodyFATPercentage
        {
            get { return _decBodyFATPercentage; }
            set { _decBodyFATPercentage = value; }
        }

        public decimal DecBMI
        {
            get { return _decBMI; }
            set { _decBMI = value; }
        }

        public decimal DecWaist
        {
            get { return _decWaist; }
            set { _decWaist = value; }
        }

        public decimal DecWeight
        {
            get { return _decWeight; }
            set { _decWeight = value; }
        }

        public int IntPersonalSummaryId
        {
            get { return _intPersonalSummaryId; }
            set { _intPersonalSummaryId = value; }
        }
#endregion
    }
}
