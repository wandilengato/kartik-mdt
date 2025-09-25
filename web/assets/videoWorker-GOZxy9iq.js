(function(){"use strict";self.onmessage=s=>{const{videoChunks:e}=s.data;if(e&&e.length>0){const o=new Blob(e,{type:"video/webm"});self.postMessage(o)}else self.postMessage(new Blob)}})();
