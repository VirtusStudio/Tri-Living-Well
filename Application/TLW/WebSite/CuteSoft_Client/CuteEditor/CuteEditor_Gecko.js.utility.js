var OxOc5c8=["attachEvent","on","addEventListener","detachEvent","removeEventListener","Object","width","left=","availWidth",",top=","availHeight",",width=",",height=",",resizable=1,status=1","","window has been blocked","dialogArguments","focus","unload","DIV","document","top","cssText","style","position:absolute;left:0px;top:0px;width:100%;height:100%;filter:alpha(opacity=30);background-color:#808080;","MozOpacity","innerHTML","\x26nbsp;","onclick","body","returnValue","undefined","closed","html","string","-1","ok","yes","true","1","length","value","%3b","s:","n:","b:","boolean","number",";","="," ","startOffset","endOffset","startContainer","endContainer","None","Control","Text","nodeType","parentNode","nodeValue","childNodes"];var id_nsc=0x0; function NotifySelectionChange(Ox1d8){ clearTimeout(id_nsc) ; id_nsc=setTimeout(function (){ editor.UpdateToolbar() ; editor.LogSavePoint() ;} ,parseInt(Ox1d8)||0x64) ;}  ; function AttachDomEvent(obj,name,Ox1d5){if(obj[OxOc5c8[0x0]]){ obj.attachEvent(OxOc5c8[0x1]+name,Ox1d5) ;} ;if(obj[OxOc5c8[0x2]]){ obj.addEventListener(name,Ox1d5,true) ;} ;}  ; function DetachDomEvent(obj,name,Ox1d5){if(obj[OxOc5c8[0x3]]){ obj.detachEvent(OxOc5c8[0x1]+name,Ox1d5) ;} ;if(obj[OxOc5c8[0x4]]){ obj.removeEventListener(name,Ox1d5,true) ;} ;}  ;var lastmodalwindowtime=0x0; function showModalDialog(Oxba,Ox382,Ox383,Ox384){ lastmodalwindowtime= new Date().getTime() ;if(Ox383==null|| typeof (Ox383)==OxOc5c8[0x5]){var Ox2e=(Ox383||{})[OxOc5c8[0x6]]||0x190;var h=(Ox383||{})[OxOc5c8[0x6]]||0x12c; Ox383=OxOc5c8[0x7]+(screen[OxOc5c8[0x8]]-Ox2e)/0x2+OxOc5c8[0x9]+(screen[OxOc5c8[0xa]]-h)/0x2+OxOc5c8[0xb]+Ox2e+OxOc5c8[0xc]+h+OxOc5c8[0xd] ;} ;var Ox18d; Ox18d=window.open(Oxba,OxOc5c8[0xe],Ox383) ;if(Ox18d==null){throw ( new Error(-0x1,OxOc5c8[0xf]));} ; Ox18d[OxOc5c8[0x10]]=Ox382 ; AttachDomEvent(window,OxOc5c8[0x11],Ox389) ; AttachDomEvent(editwin,OxOc5c8[0x11],Ox389) ; AttachDomEvent(Ox18d,OxOc5c8[0x12],Ox38b) ;var Ox74=null;var Ox388=false;var div; div=window[OxOc5c8[0x15]][OxOc5c8[0x14]].createElement(OxOc5c8[0x13]) ; div[OxOc5c8[0x17]][OxOc5c8[0x16]]=OxOc5c8[0x18] ; div[OxOc5c8[0x17]][OxOc5c8[0x19]]=0.3 ; div[OxOc5c8[0x1a]]=OxOc5c8[0x1b] ; div[OxOc5c8[0x1c]]=Ox389 ; window[OxOc5c8[0x15]][OxOc5c8[0x14]][OxOc5c8[0x1d]].appendChild(div) ;if( typeof (Ox18d[OxOc5c8[0x1e]])!=OxOc5c8[0x1f]){ Ox18d[OxOc5c8[0x1e]]=Ox74 ;} ;return Ox18d; function Ox389(){if(!Ox18d){return ;} ;if(Ox18d[OxOc5c8[0x20]]){ Ox38d() ;return ;} ; setTimeout(Ox38a,0x1) ; function Ox38a(){try{ Ox18d.focus() ;} catch(x){} ;}  ;}  ; function Ox38b(){try{ Ox74=Ox18d[OxOc5c8[0x1e]] ;} catch(x){} ;try{ DetachDomEvent(Ox18d,OxOc5c8[0x12],Ox38b) ;} catch(x){} ; setTimeout(function Ox38c(){if(Ox388){return ;} ;if(!Ox18d){return ;} ;if(!Ox18d[OxOc5c8[0x20]]){try{ AttachDomEvent(Ox18d,OxOc5c8[0x12],Ox38b) ;} catch(x){} ;return ;} ; Ox38d() ;} ,0x64) ;}  ; function Ox38d(){if(Ox388){return ;} ; Ox388=true ;if(div){ window[OxOc5c8[0x15]][OxOc5c8[0x14]][OxOc5c8[0x1d]].removeChild(div) ; div[OxOc5c8[0x1c]]=null ; div=null ;} ;try{ DetachDomEvent(editwin,OxOc5c8[0x11],Ox389) ; DetachDomEvent(window,OxOc5c8[0x11],Ox389) ;} catch(x){} ;try{ DetachDomEvent(Ox18d,OxOc5c8[0x12],Ox38b) ;} catch(x){} ;try{try{if(Ox74==null){if( typeof (Ox18d[OxOc5c8[0x1e]])!=OxOc5c8[0x1f]){ Ox74=Ox18d[OxOc5c8[0x1e]] ;} ;} ;} catch(x){} ;var Ox341= new Object(); Ox341[OxOc5c8[0x1e]]=Ox74 ; Ox384(Ox74,Ox341) ;} finally{ Ox18d=null ; Ox74=null ;} ;}  ;}  ; function GetSavePoint(){return {html:editdoc[OxOc5c8[29]][OxOc5c8[26]]};}  ; function RestoreSavePoint(Oxa7){ editdoc[OxOc5c8[0x1d]][OxOc5c8[0x1a]]=Oxa7[OxOc5c8[0x21]] ;}  ; function ToBoolean(Ox223){if( typeof (Ox223)==OxOc5c8[0x22]){switch(Ox223.toLowerCase()){case OxOc5c8[0x27]:case OxOc5c8[0x26]:case OxOc5c8[0x25]:case OxOc5c8[0x1]:case OxOc5c8[0x24]:case OxOc5c8[0x23]: Ox223=true ;break ;default: Ox223=false ;;;;;;;;} ;} ;return Ox223?true:false;}  ;var _data={}; function GetData(name){return _data[name];}  ; function SetData(name,Ox5b){ _data[name]=Ox5b ;}  ;var _log_sps=[];var _log_index=-0x1; function Log_CanUndo(){if(_log_index==-0x1){return false;} ;return _log_index>0x0;}  ; function Log_Undo(){if(!Log_CanUndo()){return false;} ; _log_index-- ;return true;}  ; function Log_CanRedo(){if(_log_index==-0x1){return false;} ;return _log_index+0x1<_log_sps[OxOc5c8[0x28]];}  ; function Log_Redo(){if(!Log_CanRedo()){return false;} ; _log_index++ ;return true;}  ; function Log_GetSavePoint(){return _log_sps[_log_index];}  ; function Log_SetSavePoint(Ox256){if(_log_index>=0x0&&_log_index<_log_sps[OxOc5c8[0x28]]){ _log_sps[_log_index]=Ox256 ;} ;}  ; function Log_AddSavePoint(Ox256){if(_log_index==-0x1){ _log_sps[0x0]=Ox256 ; _log_index=0x0 ;return ;} ;if(_log_sps[_log_index][OxOc5c8[0x21]]==Ox256[OxOc5c8[0x21]]){ _log_sps[_log_index]=Ox256 ;return ;} ; _log_index++ ;if(Log_CanRedo()){ _log_sps[OxOc5c8[0x28]]=_log_index ;} ; _log_sps[_log_index]=Ox256 ;}  ;var _states={};var _statenames=[]; function GetState(name,Ox25b){var Ox5b=_states[name];if( typeof (Ox5b)==OxOc5c8[0x1f]){return Ox25b;} ;return Ox5b;}  ; function SetState(name,Ox5b){ _states[name]=Ox5b ;for(var i=0x0;i<_statenames[OxOc5c8[0x28]];i++){if(_statenames[i]==name){return ;} ;} ; _statenames[_statenames[OxOc5c8[0x28]]]=name ;if(initcomplete){ statectrl[OxOc5c8[0x29]]=GetStateExpression() ;} ;}  ; function GetStateExpression(){if(_statenames[OxOc5c8[0x28]]==0x0){return OxOc5c8[0xe];} ;var Ox25=OxOc5c8[0xe];for(var i=0x0;i<_statenames[OxOc5c8[0x28]];i++){var name=_statenames[i];var Ox5b=GetState(name);switch( typeof (Ox5b)){case OxOc5c8[0x22]: Ox5b=OxOc5c8[0x2b]+escape(Ox5b).replace(/;/g,OxOc5c8[0x2a]) ;break ;case OxOc5c8[0x2f]: Ox5b=OxOc5c8[0x2c]+Ox5b ;break ;case OxOc5c8[0x2e]: Ox5b=OxOc5c8[0x2d]+Ox5b ;break ;default:continue ;;;;;} ;if(Ox25!=OxOc5c8[0xe]){ Ox25+=OxOc5c8[0x30] ;} ; Ox25+=name+OxOc5c8[0x31]+Ox5b ;} ;return Ox25;}  ; function SetStateExpression(Ox25f){var arr=Ox25f.split(OxOc5c8[0x30]);for(var i=0x0;i<arr[OxOc5c8[0x28]];i++){var Ox25=arr[i];if(Ox25==OxOc5c8[0xe]){continue ;} ;var Ox2f=Ox25.split(OxOc5c8[0x31]);if(Ox2f[OxOc5c8[0x28]]!=0x2){continue ;} ;var n=Ox2f[0x0];var Ox9=Ox2f[0x1];switch(Ox9.substr(0x0,0x2)){case OxOc5c8[0x2d]: Ox9=ToBoolean(Ox9.substr(0x2,Ox9[OxOc5c8[0x28]]-0x2)) ;break ;case OxOc5c8[0x2b]: Ox9=unescape(Ox9.substr(0x2,Ox9[OxOc5c8[0x28]]-0x2).replace(/\+/g,OxOc5c8[0x32])) ;break ;case OxOc5c8[0x2c]: Ox9=parseFolat(Ox9.substr(0x2,Ox9[OxOc5c8[0x28]]-0x2)) ;break ;;;;} ; SetState(n,Ox9) ;} ;}  ; function RestoreStates(){ SetStateExpression(statectrl.value) ; ExecCommand_ToggleBorder() ;if(_get_FullPage()==true){ ExecCommand_FullPage() ;} ; FixActiveTabUI() ; SyncToFrame() ;}  ; function Range_GetSelectionType(Ox175){var Ox32e=Ox175[OxOc5c8[0x33]];var Ox32f=Ox175[OxOc5c8[0x34]];var Ox330=Ox175[OxOc5c8[0x35]];var Ox331=Ox175[OxOc5c8[0x36]];if(Ox32e==Ox32f&&Ox330==Ox331){return OxOc5c8[0x37];} ;if(Ox32f-Ox32e==0x1&&Ox330==Ox331){return OxOc5c8[0x38];} ;return OxOc5c8[0x39];}  ; function Range_IsNodeSelected(Ox175,Ox27e){if(Ox175[OxOc5c8[0x35]]!=Ox175[OxOc5c8[0x36]]){return false;} ;var Oxf0=Range_GetSelectionType(Ox175);if(Oxf0==OxOc5c8[0x37]){return false;} ;if(Oxf0==OxOc5c8[0x38]){return Range_GetParentElement(Ox175)==Ox27e;} ;if(Ox175[OxOc5c8[0x33]]!=0x0){return false;} ;if(Ox175[OxOc5c8[0x35]][OxOc5c8[0x3a]]==0x3){if(Ox175[OxOc5c8[0x35]][OxOc5c8[0x3b]]!=Ox27e){return false;} ;if(Ox175[OxOc5c8[0x34]]!=Ox175[OxOc5c8[0x35]][OxOc5c8[0x3c]][OxOc5c8[0x28]]+0x1){return false;} ;return true;} ;return Ox175[OxOc5c8[0x34]]==Ox27e[OxOc5c8[0x3d]][OxOc5c8[0x28]]+0x1;}  ; function Range_GetParentElement(Ox175){var Ox32e=Ox175[OxOc5c8[0x33]];var Ox32f=Ox175[OxOc5c8[0x34]];var Ox330=Ox175[OxOc5c8[0x35]];var Ox331=Ox175[OxOc5c8[0x36]];if(Ox32e==Ox32f&&Ox330==Ox331){if(Ox330[OxOc5c8[0x3a]]==0x3){return Ox330[OxOc5c8[0x3b]];} ;return Ox330;} ;if(Ox32f-Ox32e==0x1&&Ox330==Ox331){return Ox330[OxOc5c8[0x3d]][Ox32e];} ;var Ox334=[];for(var Ox335=Ox330;Ox335!=null;Ox335=Ox335[OxOc5c8[0x3b]]){ Ox334[Ox334[OxOc5c8[0x28]]]=Ox335 ;} ; Ox334.reverse() ;var Ox336=[];for(var Ox335=Ox330;Ox335!=null;Ox335=Ox335[OxOc5c8[0x3b]]){ Ox336[Ox336[OxOc5c8[0x28]]]=Ox335 ;} ; Ox336.reverse() ;var Ox337=null;var Ox194=Math.min(Ox334[OxOc5c8[0x28]],Ox336.length);for(var i=0x0;i<Ox194;i++){if(Ox334[i]==Ox336[i]){ Ox337=Ox334[i] ;} else {break ;} ;} ;if(Ox337[OxOc5c8[0x3a]]==0x3){ Ox337=Ox337[OxOc5c8[0x3b]] ;} ;return Ox337;}  ;