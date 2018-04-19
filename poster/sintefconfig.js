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
		str = str.replace(/æ/g, '\\ae{}');
		str = str.replace(/ø/g, '\\o{}');
		str = str.replace(/å/g, '\\aa{}');
		str = str.replace(/Æ/g, '\\AE{}');
		str = str.replace(/Ø/g, '\\O{}');
		str = str.replace(/Å/g, '\\AA{}');
		str = str.replace(/à/g, "\\`{a}");
		str = str.replace(/á/g, "\\'{a}");
		str = str.replace(/â/g, "\\^{a}");
		str = str.replace(/ã/g, "\\~{a}");
		str = str.replace(/ä/g, '\\"{a}');
		str = str.replace(/è/g, "\\`{e}");
		str = str.replace(/é/g, "\\'{e}");
		str = str.replace(/ê/g, "\\^{e}");
		str = str.replace(/ë/g, '\\"{e}');
		str = str.replace(/ì/g, "\\`{i}");
		str = str.replace(/í/g, "\\'{i}");
		str = str.replace(/î/g, "\\^{i}");
		str = str.replace(/ï/g, '\\"{i}');
		str = str.replace(/ò/g, "\\`{o}");
		str = str.replace(/ó/g, "\\'{o}");
		str = str.replace(/ô/g, "\\^{o}");
		str = str.replace(/õ/g, "\\~{o}");
		str = str.replace(/ö/g, '\\"{o}');
		str = str.replace(/ù/g, "\\`{u}");
		str = str.replace(/ú/g, "\\'{u}");
		str = str.replace(/û/g, "\\^{u}");
		str = str.replace(/ü/g, '\\"{u}');
		str = str.replace(/ý/g, "\\'{y}");
		str = str.replace(/ÿ/g, '\\"{y}');
		str = str.replace(/À/g, "\\`{A}");
		str = str.replace(/Á/g, "\\'{A}");
		str = str.replace(/Â/g, "\\^{A}");
		str = str.replace(/Ã/g, "\\~{A}");
		str = str.replace(/Ä/g, '\\"{A}');
		str = str.replace(/È/g, "\\`{E}");
		str = str.replace(/É/g, "\\'{E}");
		str = str.replace(/Ê/g, "\\^{E}");
		str = str.replace(/Ë/g, '\\"{E}');
		str = str.replace(/Ì/g, "\\`{I}");
		str = str.replace(/Í/g, "\\'{I}");
		str = str.replace(/Î/g, "\\^{I}");
		str = str.replace(/Ï/g, '\\"{I}');
		str = str.replace(/Ò/g, "\\`{O}");
		str = str.replace(/Ó/g, "\\'{O}");
		str = str.replace(/Ô/g, "\\^{O}");
		str = str.replace(/Õ/g, "\\~{O}");
		str = str.replace(/Ö/g, '\\"{O}');
		str = str.replace(/Ù/g, "\\`{U}");
		str = str.replace(/Ú/g, "\\'{U}");
		str = str.replace(/Û/g, "\\^{U}");
		str = str.replace(/Ü/g, '\\"{U}');
		str = str.replace(/Ý/g, "\\'{Y}");
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

