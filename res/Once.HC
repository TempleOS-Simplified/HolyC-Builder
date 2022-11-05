/*
    MIT License

    Copyright (c) 2022 Xzntrc

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
*/

U0 runcmd(U8 *param){
    DskChg('T');
    Silent;
    CopyTree("T:/", "C:/HolyC"); //  Silent just silences stdout.
    Silent(OFF); 
    U8 *file;
    if (!StrCmp(param, "")) file = "Main";
    else file = param;
    Cd("C:/HolyC");
    U8 *filehc = MStrPrint("C:/HolyC/%s.HC",file);
    U8 *filehcz = MStrPrint("C:/HolyC/%s.HC.Z",file);

    "--Output--\n";

    if (FileFind(filehc)) ExeFile2(filehc);
    else if (FileFind(filehcz)) "HolyC Builder does not support .Z\n";
    else "No suitable executable could be found.\n";

    Free(filehc),Free(filehcz);

}
U0 loop() {
    "Holy Builder Interactive Shell\n";
    "To quit, type 'quit'\n";
    // Constantly looping and refreshing input
    U8 *input;

    U8 *action,*param;

    while (TRUE) {
        input = GetStr(">");
        /*
            Thank you nrootconauto for your help with this code.
            - Xzntrc
        */
        action=CAlloc(StrLen(input)+1),param=CAlloc(StrLen(input)+1); 
        StrScan(input,"%s.%s",&action,&param);
        if(StrOcc(input,'.')) {
          if (StrCmp(action, "quit") == 0) break;
          else if (StrCmp(action, "run") == 0) runcmd(param);
        } else {
          if (!StrCmp(input,"quit")) break;
          else if (!StrCmp(action,"run")) runcmd("");
        }
        Free(action);
        action=NULL;
  Free(param);
param=NULL;
    }
    Free(action),Free(param);
}

OnceExe;
DocClear;
WinMax;
Cd("C:/HolyC");
loop;