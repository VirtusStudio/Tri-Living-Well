using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class QuestionnaireInfo
    {
        #region  QUESTIONNAIRE INFO PRIVATE MEMBER DECLARATION
        
        private Guid _guidUserId;

        private string _strValueCode;

        private int _intQuestionnaireId;

        private int _intQuestionnaireType;

        private int _intGlobalCodesId;

        private string _strGlobalCodeCategory;

        private string _strHeading;

        private string strValue;

        private string _strQuestionHeading;

        private string _strQuestion;

        private string _strAnswer;
        
        
        private char _chrDisplayYes;
        
        private char _chrDisplayNo;

        private char _chrDisplayDontKnow;

        private char _chrIsActive;

        private char _chrIsDeleted;

        private DateTime _dtDeletedDate;

        private DateTime _dtCreatedDate;

        #endregion

        #region QUESTIONNAIRE INFO PROPERTY DECLARATION

        public string StrAnswer
        {
            get { return _strAnswer; }
            set { _strAnswer = value; }
        }

        public string StrValueCode
        {
            get { return _strValueCode; }
            set { _strValueCode = value; }
        }


        public Guid GuidUserId
        {
            get { return _guidUserId; }
            set { _guidUserId = value; }
        }

        public DateTime DtCreatedDate
        {
            get { return _dtCreatedDate; }
            set { _dtCreatedDate = value; }
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


        public char ChrDisplayDontKnow
        {
            get { return _chrDisplayDontKnow; }
            set { _chrDisplayDontKnow = value; }
        }

        public char ChrDisplayNo
        {
            get { return _chrDisplayNo; }
            set { _chrDisplayNo = value; }
        }


        public char ChrDisplayYes
        {
            get { return _chrDisplayYes; }
            set { _chrDisplayYes = value; }
        }


        public string StrQuestion
        {
            get { return _strQuestion; }
            set { _strQuestion = value; }
        }
        public int IntQuestionnaireType
        {
            get { return _intQuestionnaireType; }
            set { _intQuestionnaireType = value; }
        }

        public int IntQuestionnaireId
        {
            get { return _intQuestionnaireId; }
            set { _intQuestionnaireId = value; }
        }


        public string StrValue
        {
            get { return strValue; }
            set { strValue = value; }
        }

        public string StrHeading
        {
            get { return _strHeading; }
            set { _strHeading = value; }
        }

        public string StrGlobalCodeCategory
        {
            get { return _strGlobalCodeCategory; }
            set { _strGlobalCodeCategory = value; }
        }

        public int IntGlobalCodesId
        {
            get { return _intGlobalCodesId; }
            set { _intGlobalCodesId = value; }
        }



        public string StrQuestionHeading
        {
            get { return _strQuestionHeading; }
            set { _strQuestionHeading = value; }
        }

        #endregion
    }
}
