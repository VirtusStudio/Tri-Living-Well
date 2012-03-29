///***********************************************************
///Author Name: Pardeep Kumar
///Creation Date: 07 April, 2011 
///File Name:   UserInfo.aspx.cs			Component Used: 
///Called From: BLL
///Description: This file contains all the properties for User
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
    public class UserInfo
    {

        #region USER INFO PRIVATE MEMBER DECLARATION

        private int _intSectionVisitedId;

        private string _strUserId;

        private string _strUserType;

        private DateTime _dtCreatedOn;

        private string _strAgent;

        private string _strVisitedIP;

        private string _strSectionVisited;

        private string _strDateFrom;

        private string _strDateTo;

        private int _intFAQId;

        private string _strHeading;

        private char _chrUserType;

        private int _intQuestionId;

        private string _strQuestion;

        private string _strAnswer;

        private char _chrisDeleted;

        private DateTime _dtDeletedOn;

        private int _IntFAQTopicId;

        private int _intFavoriteId;

        private string _strTitle;

        private string _strFavoriteType;

        private int _intFavoriteTypeId;

        private string _strFaqTopic;


        private int _intFoodExchangeChartId;
        private int _intCalories;
        private int _intMilk;
        private int _intFruit;
        private int _intVegetable;
        private int _intStarch;
        private int _intProtein;
        private int _intFat;  private int _intWater;
        private DateTime _dtModifiedOn;
        private string _strModifiedBy;

        private int _intActivityTypeId;
        private string _strActivityName;
        private string _strDescription;
        private decimal _decMET;


        public decimal DecMET
        {
            get { return _decMET; }
            set { _decMET = value; }
        }

        public string StrDescription
        {
            get { return _strDescription; }
            set { _strDescription = value; }
        }


        public string StrActivityName
        {
            get { return _strActivityName; }
            set { _strActivityName = value; }
        }


        public int IntActivityTypeId
        {
            get { return _intActivityTypeId; }
            set { _intActivityTypeId = value; }
        }


        #endregion

        #region USER INFO PROPERTY DECLARATION

        public int IntWater
        {
            get { return _intWater; }
            set { _intWater = value; }
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

        public string StrTitle
        {
            get { return _strTitle; }
            set { _strTitle = value; }
        }

        public int IntFavoriteId
        {
            get { return _intFavoriteId; }
            set { _intFavoriteId = value; }
        }


        public int IntFAQTopicId
        {
            get { return _IntFAQTopicId; }
            set { _IntFAQTopicId = value; }
        }

        public string StrFaqTopic
        {
            get { return _strFaqTopic; }
            set { _strFaqTopic = value; }
        }

         
        public DateTime DtDeletedOn
        {
            get { return _dtDeletedOn; }
            set { _dtDeletedOn = value; }
        }

        public char ChrisDeleted
        {
            get { return _chrisDeleted; }
            set { _chrisDeleted = value; }
        }

        public string StrAnswer
        {
            get { return _strAnswer; }
            set { _strAnswer = value; }
        }

        public string StrQuestion
        {
            get { return _strQuestion; }
            set { _strQuestion = value; }
        }

        public int IntQuestionId
        {
            get { return _intQuestionId; }
            set { _intQuestionId = value; }
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



        public string StrDateTo
        {
            get { return _strDateTo; }
            set { _strDateTo = value; }
        }

        public string StrDateFrom
        {
            get { return _strDateFrom; }
            set { _strDateFrom = value; }
        }

        public string StrSectionVisited
        {
            get { return _strSectionVisited; }
            set { _strSectionVisited = value; }
        }

        public string StrVisitedIP
        {
            get { return _strVisitedIP; }
            set { _strVisitedIP = value; }
        }

        public string StrAgent
        {
            get { return _strAgent; }
            set { _strAgent = value; }
        }

        public DateTime DtCreatedOn
        {
            get { return _dtCreatedOn; }
            set { _dtCreatedOn = value; }
        }

        public string StrUserType
        {
            get { return _strUserType; }
            set { _strUserType = value; }
        }

        public string StrUserId
        {
            get { return _strUserId; }
            set { _strUserId = value; }
        }

        public int IntSectionVisitedId
        {
            get { return _intSectionVisitedId; }
            set { _intSectionVisitedId = value; }
        }



        public string StrModifiedBy
        {
            get { return _strModifiedBy; }
            set { _strModifiedBy = value; }
        }


        public DateTime DtModifiedOn
        {
            get { return _dtModifiedOn; }
            set { _dtModifiedOn = value; }
        }

        public int IntFat
        {
            get { return _intFat; }
            set { _intFat = value; }
        }

        public int IntProtein
        {
            get { return _intProtein; }
            set { _intProtein = value; }
        }

        public int IntStarch
        {
            get { return _intStarch; }
            set { _intStarch = value; }
        }


        public int IntVegetable
        {
            get { return _intVegetable; }
            set { _intVegetable = value; }
        }


        public int IntFruit
        {
            get { return _intFruit; }
            set { _intFruit = value; }
        }

        public int IntMilk
        {
            get { return _intMilk; }
            set { _intMilk = value; }
        }


        public int IntCalories
        {
            get { return _intCalories; }
            set { _intCalories = value; }
        }

        public int IntFoodExchangeChartId
        {
            get { return _intFoodExchangeChartId; }
            set { _intFoodExchangeChartId = value; }
        }

        #endregion

    }

    public class FoodIntakeInfo
    {

        #region FOOD INTAKE PRIVATE MEMBER DECLARATION

        private int _intFoodIntakeLogId;
        private string _strUserId;
        private DateTime _dtFoodIntakeDate;
        private int _intCalorie;
        private string _strMilkDetails;
        private string _strFruitDetails;
        private string _strVegetablesDetails;
        private string _strStarchDetails;
        private string _strProteinDetails;
        private string _strFATDetails;
        private string _strWaterDetails;
        private char _chrIsDeleted;
        private DateTime _dtDeletedOn;
        private DateTime _dtCreatedOn;


      
        #endregion

        #region FOOD INTAKE PUBLIC MEMBER DECLARATION

        public DateTime DtCreatedOn
        {
            get { return _dtCreatedOn; }
            set { _dtCreatedOn = value; }
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

        public string StrWaterDetails
        {
            get { return _strWaterDetails; }
            set { _strWaterDetails = value; }
        }

        public string StrFATDetails
        {
            get { return _strFATDetails; }
            set { _strFATDetails = value; }
        }

        public string StrProteinDetails
        {
            get { return _strProteinDetails; }
            set { _strProteinDetails = value; }
        }


        public string StrStarchDetails
        {
            get { return _strStarchDetails; }
            set { _strStarchDetails = value; }
        }

        public string StrVegetablesDetails
        {
            get { return _strVegetablesDetails; }
            set { _strVegetablesDetails = value; }
        }

        public string StrFruitDetails
        {
            get { return _strFruitDetails; }
            set { _strFruitDetails = value; }
        }

        public string StrMilkDetails
        {
            get { return _strMilkDetails; }
            set { _strMilkDetails = value; }
        }

        public int IntCalorie
        {
            get { return _intCalorie; }
            set { _intCalorie = value; }
        }

        public DateTime DtFoodIntakeDate
        {
            get { return _dtFoodIntakeDate; }
            set { _dtFoodIntakeDate = value; }
        }


        public string StrUserId
        {
            get { return _strUserId; }
            set { _strUserId = value; }
        }

        public int IntFoodIntakeLogId
        {
            get { return _intFoodIntakeLogId; }
            set { _intFoodIntakeLogId = value; }
        }

        #endregion
    }
}
