# A tap for Homebrew | homebrew-tap
A tap for Homebrew<br><br>
[![Travis CI](https://travis-ci.org/smileycreations15/homebrew-tap.svg?branch=master)](https://travis-ci.org/smileycreations15/homebrew-tap)
<img src="https://smileycreations15.com/files/images/load-1.gif" id="load">
## Add the tap:
```sh
brew tap smileycreations15/tap
```
## Built-in tap commands:
1. Install a older version of formula.<br>
```
brew install-version [formula] [version]
```

2. Check for older versions of formula.<br>
```
brew check-version [formula]
```
3. Install a older version of casks.<br>
```
brew cask-install-version [cask] [version]
```

4. Check for older versions of casks.<br>
```
brew cask-check-version [cask]
```

## Request a formula/cask:
<div id="form-1" class="page-header">
<input type="text" value="enhancement" name="labels" style="display:none">
<input type="text" value="smileycreations15" name="assignees" style="display:none">
Formula/cask name: <br><br><input type="text" placeholder="Formula/cask name" id="formulaName" style="color:#606c71" autocomplete="off"><br><br>
Description: <br><br><textarea autocomplete="off" id="desc" rows="4" cols="50" maxlength="400" placeholder="A description of the formula/cask. Max 400 characters" style="margin: 0px; height: 116px; width: 354px;resize:none;color:#606c71">
</textarea><br><br>
 Details (markdown supported): <br><br><textarea autocomplete="off" id="extra-desc" rows="4" cols="50" placeholder="Details about the formula/cask" style="margin: 0px; height: 116px; width: 354px;resize:vertical;color:#606c71">
</textarea><br><br>
<button onclick="send()" class="btn">Send</button>
<p id="error"></p>
</div>
<script>
  
document.getElementById("load").style.display = "none"
var css = document.createElement("style");
css.type = "text/css";
css.innerHTML = ".spinner {\r\n  margin: 50px;\r\n  height: 28px;\r\n  width: 28px;\r\n  animation: rotate 0.8s infinite linear;\r\n  border: 8px solid #fff;\r\n  border-right-color: transparent;\r\n  border-radius: 50%;\r\n}\r\n\r\n@keyframes rotate {\r\n  0%    { transform: rotate(0deg); }\r\n  100%  { transform: rotate(360deg); }\r\n}";
document.body.appendChild(css);

function send(){
if (null === document.getElementById("formulaName").value || undefined === document.getElementById("formulaName").value || "" === document.getElementById("formulaName").value){
document.getElementById("error").innerHTML = "Please enter a formula/cask name"
return
}
if (null === document.getElementById("desc").value || undefined === document.getElementById("desc").value || "" === document.getElementById("desc").value){
document.getElementById("error").innerHTML = "Please enter a description"
return
}
if (null === document.getElementById("desc").value || undefined === document.getElementById("desc").value || "" === document.getElementById("desc").value){
document.getElementById("error").innerHTML = "Please enter a description"
return
}
if (null === document.getElementById("extra-desc").value || undefined === document.getElementById("extra-desc").value || "" === document.getElementById("extra-desc").value){
document.getElementById("error").innerHTML = "Please enter details about the formula"
return
}
  let encoded = "https://github.com/smileycreations15/homebrew-tap/issues/new?title=" + encodeURIComponent("New formula/cask request for " + document.getElementById("formulaName").value) + "&" +
  "body=" + encodeURIComponent( "| Formula/Cask Name | Description |\n" + 
  "|----------------|-------------|\n" +
  "| " + document.getElementById("formulaName").value + " | " + document.getElementById("desc").value + " |" + "\n\n" +
  "<hr>\n\n" + document.getElementById("extra-desc").value) + "&template=new-formula-request.md&assignees=smileycreations15&labels=enhancement";
  document.getElementById("form-1").innerHTML = '<h2 style="color:#fff">Please wait...</h2><br><br><img src="https://smileycreations15.com/files/images/load-1.gif" id="load1">'

  open(encoded,"_self")
}
</script>
