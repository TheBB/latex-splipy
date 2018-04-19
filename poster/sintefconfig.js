/* vim: fileencoding=iso8859-1 
 * */

/* Generator for sintefconfig.tex
 *
 * Author: Olaf Trygve Berglihn <oberg@sintef.no>
 * Date:   2012-09-12
 *
 * This script will create your individual configuration file for use with the
 * SINTEF LaTeX-templates provided by Federico Zenith.
 *
 * Put this file together with your sintef LaTeX templates and double click it
 * to generate a new and personalized template configuration.
 *
 * The script takes advantage of the SINTEF registry settings on windows
 * found under hkey_current_user\software\sintef\maldata
 *
 * All (most) non-ascii characters are encoded with LaTeX accents or special
 * commands to overcome that the scripting engine most probably will write the
 * sintefconfig.tex as a non utf-8 encoded file.
*/

var fso = WScript.CreateObject("Scripting.FileSystemObject");
var fd = fso.CreateTextFile("sintefconfig.tex", true);
var WshShell = WScript.CreateObject ("WScript.Shell");
function get(tag)
{
	var str;
	try {
		str = WshShell.RegRead("HKCU\\Software\\Sintef\\maldata\\" + tag);
		str = str.replace(/�/g, '\\ae{}');
		str = str.replace(/�/g, '\\o{}');
		str = str.replace(/�/g, '\\aa{}');
		str = str.replace(/�/g, '\\AE{}');
		str = str.replace(/�/g, '\\O{}');
		str = str.replace(/�/g, '\\AA{}');
		str = str.replace(/�/g, "\\`{a}");
		str = str.replace(/�/g, "\\'{a}");
		str = str.replace(/�/g, "\\^{a}");
		str = str.replace(/�/g, "\\~{a}");
		str = str.replace(/�/g, '\\"{a}');
		str = str.replace(/�/g, "\\`{e}");
		str = str.replace(/�/g, "\\'{e}");
		str = str.replace(/�/g, "\\^{e}");
		str = str.replace(/�/g, '\\"{e}');
		str = str.replace(/�/g, "\\`{i}");
		str = str.replace(/�/g, "\\'{i}");
		str = str.replace(/�/g, "\\^{i}");
		str = str.replace(/�/g, '\\"{i}');
		str = str.replace(/�/g, "\\`{o}");
		str = str.replace(/�/g, "\\'{o}");
		str = str.replace(/�/g, "\\^{o}");
		str = str.replace(/�/g, "\\~{o}");
		str = str.replace(/�/g, '\\"{o}');
		str = str.replace(/�/g, "\\`{u}");
		str = str.replace(/�/g, "\\'{u}");
		str = str.replace(/�/g, "\\^{u}");
		str = str.replace(/�/g, '\\"{u}');
		str = str.replace(/�/g, "\\'{y}");
		str = str.replace(/�/g, '\\"{y}');
		str = str.replace(/�/g, "\\`{A}");
		str = str.replace(/�/g, "\\'{A}");
		str = str.replace(/�/g, "\\^{A}");
		str = str.replace(/�/g, "\\~{A}");
		str = str.replace(/�/g, '\\"{A}');
		str = str.replace(/�/g, "\\`{E}");
		str = str.replace(/�/g, "\\'{E}");
		str = str.replace(/�/g, "\\^{E}");
		str = str.replace(/�/g, '\\"{E}');
		str = str.replace(/�/g, "\\`{I}");
		str = str.replace(/�/g, "\\'{I}");
		str = str.replace(/�/g, "\\^{I}");
		str = str.replace(/�/g, '\\"{I}');
		str = str.replace(/�/g, "\\`{O}");
		str = str.replace(/�/g, "\\'{O}");
		str = str.replace(/�/g, "\\^{O}");
		str = str.replace(/�/g, "\\~{O}");
		str = str.replace(/�/g, '\\"{O}');
		str = str.replace(/�/g, "\\`{U}");
		str = str.replace(/�/g, "\\'{U}");
		str = str.replace(/�/g, "\\^{U}");
		str = str.replace(/�/g, '\\"{U}');
		str = str.replace(/�/g, "\\'{Y}");
	}
	catch (e) {
		str = "\\texttt{\\color{red}{missing " + tag + "}}";
	}
	return str;
}

fd.WriteLine('\\institute{\\EnglishNorsk{' 
		+ get('ENHETOFFNAVN_EN') + '}{'
		+ get('ENHETOFFNAVN') + '}}');
fd.WriteLine('\\department{\\EnglishNorsk{'
		+ get('AVDELING_EN') + '}{'
		+ get('AVDELING') + '}}');
fd.WriteLine('\\address{'
	+ get('POSTADRESSE1') + '\\\\'
	+ get('POSTNRSTED')
	+ '\\EnglishNorsk{\\\\NORWAY}{}}');
fd.WriteLine('\\location{'
	+ get('VISITADDRESS1') + '\\\\'
	+ get('VISITPOSTNRSTED')
	+ '\\EnglishNorsk{\\\\NORWAY}{}}');
fd.WriteLine('\\vat{' + get('FORETAKSNR').replace(/ /g, '~') + '}');
fd.Close();

