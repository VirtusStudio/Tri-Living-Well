using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;

namespace BLL
{
    public class FAQTopicLib
    {
        #region Insert Functions

        /// Function Header*******************************************************
        /// Function Name: SaveFAQTopicDetails
        /// Function Type: Function
        /// Functionality: used to save the details of FAQ topics
        /// Input: 
        /// Output: 
        /// Return Value:
        /// Note: 
        /// *********************************************************************
        public bool SaveFAQTopicDetails(Entity.FAQTopicInfo oFAQTopicInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                bool _blnRetVal = true;
                var _varFAQTopic = (from _ft in _db.FaqTopics
                                    where _ft.chrIsDeleted.Equals('N')
                                    && _ft.strFaqTopic.ToLower().Equals(oFAQTopicInfo.StrFaqTopic)
                                    select _ft
                                          ).ToList();
                if (_varFAQTopic.Count > 0)
                    _blnRetVal = false;
                else
                {
                    DAL.FaqTopic oFaqTopic = new FaqTopic();
                    oFaqTopic.strFaqTopic = oFAQTopicInfo.StrFaqTopic;
                    oFaqTopic.dtCreatedOn = DateTime.Now;
                    oFaqTopic.strCreatedBy = oFAQTopicInfo.StrCreatedBy;
                    oFaqTopic.chrIsDeleted = 'N';
                    _db.FaqTopics.InsertOnSubmit(oFaqTopic);
                    _db.SubmitChanges();
                    oFaqTopic = null;
                }


                _varFAQTopic = null;
                return _blnRetVal;
            }
        }

        #endregion

        #region Update Functions

        public bool UpdateFAQTopicDetails(Entity.FAQTopicInfo oFAQTopicInfo)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                bool _blnRetVal = true;
                var _varFAQTopic = (from _ft in _db.FaqTopics
                                    where _ft.chrIsDeleted.Equals('N')
                                    && _ft.strFaqTopic.ToLower().Equals(oFAQTopicInfo.StrFaqTopic)
                                    && _ft.int_FAQTopicId != oFAQTopicInfo.Int_FAQTopicId
                                    select _ft
                                          ).ToList();
                if (_varFAQTopic.Count > 0)
                    _blnRetVal = false;
                else
                {
                    var oFaqTopic = _db.FaqTopics.Where(x => x.int_FAQTopicId.Equals(oFAQTopicInfo.Int_FAQTopicId)).FirstOrDefault();
                    oFaqTopic.strFaqTopic = oFAQTopicInfo.StrFaqTopic;
                    _db.SubmitChanges();
                    oFaqTopic = null;
                }

                _varFAQTopic = null;
                return _blnRetVal;
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
        public void DeleteFAQTopicDetails(int _intFAQTopicId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var oFaqTopic = _db.FaqTopics.Where(x => x.int_FAQTopicId.Equals(_intFAQTopicId)).FirstOrDefault();
                if (oFaqTopic != null)
                {
                    var _varFAQ = _db.FAQs.Where(x => x.strHeading.ToLower().Equals(oFaqTopic.strFaqTopic.ToLower())).ToList();
                    foreach (var item in _varFAQ)
                    {
                        item.chrisDeleted = 'Y';
                        item.dtDeletedOn = oFaqTopic.dtDeletedOn;
                        _db.SubmitChanges();
                    }

                    oFaqTopic.chrIsDeleted = 'Y';
                    oFaqTopic.dtDeletedOn = DateTime.Now;
                    _db.SubmitChanges();



                    oFaqTopic = null;
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
        public List<Entity.FAQTopicInfo> GetAllFAQTopics()
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {

                var _varFAQRet = (from _faq in _db.FaqTopics
                                  where _faq.chrIsDeleted.Equals('N')
                                  orderby _faq.strFaqTopic ascending
                                  select new Entity.FAQTopicInfo
                                  {
                                      Int_FAQTopicId = _faq.int_FAQTopicId,
                                      StrFaqTopic = _faq.strFaqTopic,
                                      DtCreatedOn = _faq.dtCreatedOn,
                                      StrCreatedBy = _faq.strCreatedBy,
                                  }
                               ).ToList();


                return _varFAQRet;

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
        public Entity.FAQTopicInfo GetAllFAQTopicsById(int _intFaqTopicId)
        {
            using (TLWDALDataContext _db = new TLWDALDataContext())
            {
                var _varFAQRet = (from _faq in _db.FaqTopics
                                  where _faq.chrIsDeleted.Equals('N')
                                  && _faq.int_FAQTopicId.Equals(_intFaqTopicId)
                                  orderby _faq.strFaqTopic ascending
                                  select new Entity.FAQTopicInfo
                                  {
                                      Int_FAQTopicId = _faq.int_FAQTopicId,
                                      StrFaqTopic = _faq.strFaqTopic,
                                      DtCreatedOn = _faq.dtCreatedOn,
                                      StrCreatedBy = _faq.strCreatedBy,
                                  }
                               ).FirstOrDefault();
                return _varFAQRet;
            }
        }


        #endregion
    }
}
