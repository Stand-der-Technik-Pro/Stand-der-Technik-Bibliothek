
// XSD 1.0
// https://www.w3.org/TR/xmlschema-1/
// https://www.w3.org/TR/xmlschema-2/

// XSD 1.1
// https://www.w3.org/TR/xmlschema11-1/
// https://www.w3.org/TR/xmlschema11-1/#langids
// https://www.w3.org/TR/xmlschema11-2/

// https://learn.microsoft.com/en-us/dotnet/standard/data/xml/working-with-xml-schemas

using System.Xml.Linq;

string[] XsdFiles = Directory.GetFiles(@".\", "*.xsd", SearchOption.AllDirectories); // Working directory and all subdirectories

foreach (string XsdFile in XsdFiles)
{
    XDocument SchemaFile = XDocument.Load(XsdFile);

    var ns = "http://www.w3.org/2001/XMLSchema";

    Console.WriteLine($"Looking for XSD 1.1 features: {XsdFile}");

    // https://www.w3.org/TR/xmlschema11-1/#cAssertions

    var AssertDataType = SchemaFile.Descendants(XName.Get("assert", ns));

    // https://www.w3.org/TR/xmlschema11-1/#TypeAlternative

    var AlternativeDataType = SchemaFile.Descendants(XName.Get("alternative", ns));

    var OpenContent = SchemaFile.Descendants(XName.Get("complexType", ns)).Where(e => (e.Attribute("openContent") != null));

    var DefaultAttrs = SchemaFile.Descendants(XName.Get("defaultAttributes", ns));

    Console.WriteLine("Diagnostic Report for XSD Features:");

    Console.WriteLine($"Assertions: {AssertDataType.Count()}");

    Console.WriteLine($"Alternatives: {AlternativeDataType.Count()}");

    Console.WriteLine($"OpenContent: {OpenContent.Count()}");

    Console.WriteLine($"DefaultAttributes: {DefaultAttrs.Count()}");

    // https://www.w3.org/TR/xsd-precisionDecimal/

    var PrecisionDecimalDataType = SchemaFile.Descendants(XName.Get("simpleType", ns)).Where(e => e.Descendants(XName.Get("restriction", ns)).Any(r => (string?)r.Attribute("base") == "xs:precisionDecimal"));

    Console.WriteLine($"PrecisionDecimal: {PrecisionDecimalDataType.Count()}");

    Console.WriteLine($"{((AssertDataType.Any() || AlternativeDataType.Any() || OpenContent.Any() || DefaultAttrs.Any() || PrecisionDecimalDataType.Any()) ? "XSD 1.1" : "Probably not XSD 1.1")}");
}