using System;
using System.Configuration;

namespace SampleProject.example {
	public class example : System.Web.UI.Page{
		private string _url, _key, _secret;

		public string API_URL{
			get{
				if(_url == null)
					_url = ConfigurationSettings.AppSettings["API_URL"];
				return _url;
			}
		}

		public string API_KEY{
			get{
				if(_key == null)
					_key = ConfigurationSettings.AppSettings["API_KEY"];
				return _key;
			}
		}

		public string API_SECRET{
			get{
				if(_secret == null)
					_secret = ConfigurationSettings.AppSettings["API_SECRET"];
				return _secret;
			}
		}
	}
}
