///***********************************************************
///Author Name: Pardeep Kumar
///Creation Date: 21 Dec, 2010
///File Name:   CompanyInfo.aspx.cs			Component Used: 
///Called From: BLL
///Description: This file contains all the properties for Company
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

namespace Entity
{
    public class CompanyInfo
    {
        #region COMPANY INFO PRIVATE MEMBER DECLARATION

        private int _intCompanyId;
        private int _intCountryId;
        private int _intStateId;
        private int _intCompanyRequestedUsersListId;
        private string _strEmpCode;
        private string _strEmpFirstName;
        private string _strEmpMiddleName;
        private string _strEmpLastName;
        private string _strEmployeeAddress;
        private DateTime _dtEmpDateofBirth;
        private string _strEmpEmail;
        private char _chrStatus;
        
        private string _strCity;
        private string _strCompanyAddress;

        private char _chrIsPaid;
        private char _chrIsActive;
        private DateTime _dtCreatedDate;
        private DateTime _dtModifiedDate;
        private char _chrIsDeleted;
        private char _chrCreatedBy;
        private char _chrIsApproved;
        private string _strCompanyEmail;
        private string _strPassword;
        private string _strCompanyName;
        private string _strCompanyPhone;
        private string _strCompanyFax;

        private Guid _guidUserId;
        private int _intUserId;
        private string _strUserName;
        private string _strStateName;

        private int _intQuestionId;
        private string _strCategoryName;
        private string _strQuestion;
        private string _strSubject;
        private string _strComments;
        private string _strQuestionType;
        private string _strAnswer;
        private DateTime _dtCreatedOn;
        private DateTime _dtAnsweredOn;
        private char _chrIsAnsweredGiven;
        private string _strAnsweredBy;

        private string _strUserFullName;
        private string _strCategoryLevel;


        private int _intFAQId;
        private string _strHeading;
        private char _chrUserType;

        private string _strUserId;

        private string _strEmpRelationShipCode;

        private string _strEmpFamilyStatus;

        private string _strEmpGender;

        private string _strEmpPhoneORCell;



        #endregion

        #region COMPANY INFO PROPERTY DECLARATION



        public string StrEmpPhoneORCell
        {
            get { return _strEmpPhoneORCell; }
            set { _strEmpPhoneORCell = value; }
        }

        public string StrEmpGender
        {
            get { return _strEmpGender; }
            set { _strEmpGender = value; }
        }

        public string StrEmpFamilyStatus
        {
            get { return _strEmpFamilyStatus; }
            set { _strEmpFamilyStatus = value; }
        }

        public string StrEmpRelationShipCode
        {
            get { return _strEmpRelationShipCode; }
            set { _strEmpRelationShipCode = value; }
        }

        public string StrCompanyFax
        {
            get { return _strCompanyFax; }
            set { _strCompanyFax = value; }
        }


        public string StrUserId
        {
            get { return _strUserId; }
            set { _strUserId = value; }
        }

        public char ChrUserType
        {
            get { return _chrUserType; }
            set { _chrUserType = value; }
        }


        public string StrHeading
        {
            get { return _strHeading; }
            set { _strHeading = value; }
        }


        public int IntFAQId
        {
            get { return _intFAQId; }
            set { _intFAQId = value; }
        }

        public string StrCategoryLevel
        {
            get { return _strCategoryLevel; }
            set { _strCategoryLevel = value; }
        }


        public string StrStateName
        {
            get { return _strStateName; }
            set { _strStateName = value; }
        }
        public string StrCompanyPhone
        {
            get { return _strCompanyPhone; }
            set { _strCompanyPhone = value; }
        }

        public string StrCompanyName
        {
            get { return _strCompanyName; }
            set { _strCompanyName = value; }
        }


        public string StrPassword
        {
            get { return _strPassword; }
            set { _strPassword = value; }
        }

        public string StrCompanyEmail
        {
            get { return _strCompanyEmail; }
            set { _strCompanyEmail = value; }
        }


        public int IntCompanyId
        {
            get { return _intCompanyId; }
            set { _intCompanyId = value; }
        }
        public char ChrIsDeleted
        {
            get { return _chrIsDeleted; }
            set { _chrIsDeleted = value; }
        }


        public int IntStateId
        {
            get { return _intStateId; }
            set { _intStateId = value; }
        }

        public int IntCountryId
        {
            get { return _intCountryId; }
            set { _intCountryId = value; }
        }

        public DateTime DtModifiedDate
        {
            get { return _dtModifiedDate; }
            set { _dtModifiedDate = value; }
        }


        public DateTime DtCreatedDate
        {
            get { return _dtCreatedDate; }
            set { _dtCreatedDate = value; }
        }


        public char ChrIsActive
        {
            get { return _chrIsActive; }
            set { _chrIsActive = value; }
        }


        public char ChrIsPaid
        {
            get { return _chrIsPaid; }
            set { _chrIsPaid = value; }
        }

        public string StrCompanyAddress
        {
            get { return _strCompanyAddress; }
            set { _strCompanyAddress = value; }
        }

        public string StrCity
        {
            get { return _strCity; }
            set { _strCity = value; }
        }

        public char ChrCreatedBy
        {
            get { return _chrCreatedBy; }
            set { _chrCreatedBy = value; }
        }


        public char ChrIsApproved
        {
            get { return _chrIsApproved; }
            set { _chrIsApproved = value; }
        }



        public char ChrStatus
        {
            get { return _chrStatus; }
            set { _chrStatus = value; }
        }



        public string StrEmpEmail
        {
            get { return _strEmpEmail; }
            set { _strEmpEmail = value; }
        }


        public DateTime DtEmpDateofBirth
        {
            get { return _dtEmpDateofBirth; }
            set { _dtEmpDateofBirth = value; }
        }


        public string StrEmployeeAddress
        {
            get { return _strEmployeeAddress; }
            set { _strEmployeeAddress = value; }
        }


        public string StrEmpLastName
        {
            get { return _strEmpLastName; }
            set { _strEmpLastName = value; }
        }


        public string StrEmpMiddleName
        {
            get { return _strEmpMiddleName; }
            set { _strEmpMiddleName = value; }
        }


        public string StrEmpFirstName
        {
            get { return _strEmpFirstName; }
            set { _strEmpFirstName = value; }
        }


        public string StrEmpCode
        {
            get { return _strEmpCode; }
            set { _strEmpCode = value; }
        }


        public int IntCompanyRequestedUsersListId
        {
            get { return _intCompanyRequestedUsersListId; }
            set { _intCompanyRequestedUsersListId = value; }
        }
        public Guid GuidUserId
        {
            get { return _guidUserId; }
            set { _guidUserId = value; }
        }
        public int IntUserId
        {
            get { return _intUserId; }
            set { _intUserId = value; }
        }

        public string StrUserName
        {
            get { return _strUserName; }
            set { _strUserName = value; }
        }
        public string StrUserFullName
        {
            get { return _strUserFullName; }
            set { _strUserFullName = value; }
        }
        public string StrAnsweredBy
        {
            get { return _strAnsweredBy; }
            set { _strAnsweredBy = value; }
        }

        public char ChrIsAnsweredGiven
        {
            get { return _chrIsAnsweredGiven; }
            set { _chrIsAnsweredGiven = value; }
        }

        public DateTime DtAnsweredOn
        {
            get { return _dtAnsweredOn; }
            set { _dtAnsweredOn = value; }
        }

        public DateTime DtCreatedOn
        {
            get { return _dtCreatedOn; }
            set { _dtCreatedOn = value; }
        }

        public string StrAnswer
        {
            get { return _strAnswer; }
            set { _strAnswer = value; }
        }

        public string StrQuestionType
        {
            get { return _strQuestionType; }
            set { _strQuestionType = value; }
        }

        public string StrComments
        {
            get { return _strComments; }
            set { _strComments = value; }
        }

        public string StrSubject
        {
            get { return _strSubject; }
            set { _strSubject = value; }
        }

        public string StrQuestion
        {
            get { return _strQuestion; }
            set { _strQuestion = value; }
        }

        public string StrCategoryName
        {
            get { return _strCategoryName; }
            set { _strCategoryName = value; }
        }


        public int IntQuestionId
        {
            get { return _intQuestionId; }
            set { _intQuestionId = value; }
        }

        #endregion


    }
}
