using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
   public class FAQTopicInfo
    {  
       #region FAQ TOPIC INFO PRIVATE MEMBER DECLARATION

        private int _int_FAQTopicId;
        private string _strFaqTopic;
        private DateTime _dtCreatedOn;
        private string _strCreatedBy;
        private char _chrIsDeleted;
        private DateTime _dtDeletedOn;


        #endregion

        #region FAQ TOPIC INFO PROPERTY DECLARATION


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


        public string StrCreatedBy
        {
            get { return _strCreatedBy; }
            set { _strCreatedBy = value; }
        }


        public DateTime DtCreatedOn
        {
            get { return _dtCreatedOn; }
            set { _dtCreatedOn = value; }
        }


        public string StrFaqTopic
        {
            get { return _strFaqTopic; }
            set { _strFaqTopic = value; }
        }

        public int Int_FAQTopicId
        {
            get { return _int_FAQTopicId; }
            set { _int_FAQTopicId = value; }
        }
        #endregion

    }
}
