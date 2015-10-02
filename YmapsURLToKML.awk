BEGIN{
    FS="?";OFS=""; ORS=" "; OFMT = "%11.8f";
    print "<?xml version='1.0' encoding=\"Utf-8\" standalone='yes'?><kml xmlns=\"http://www.opengis.net/kml/2.2\" xmlns:gx=\"http://www.google.com/kml/ext/2.2\" xmlns:kml=\"http://www.opengis.net/kml/2.2\" xmlns:atom=\"http://www.w3.org/2005/Atom\"><Document><Placemark><name>Voskresensk 20151003</name><description/><LineString><coordinates>"
}
{
    n=split($2,params,/&/)
    for (i=1;i<=n;i++){
        split(params[i],keyval,/=/) 
        if(keyval[1]=="rl"){
            nc=split(keyval[2],coord,/~/);
            split(coord[1],stpt,/%2C/);
            lon=stpt[1];
            lat=stpt[2];
            print  (lon),",",(lat),",0";
            for(j=2;j<nc;j++){
                split(coord[j],pt,/%2C/);
                lon=lon+pt[1];
                lat=lat+pt[2];
                print  (lon),",",(lat),",0";
            }
        }
    }
}
END{
    print "</coordinates></LineString></Placemark></Document></kml>"
}
