#!/usr/bin/env python
# coding: utf-8

from re import X
import pathlib
import os, re
from pprint import pprint
from glob import glob
import pandas as pd
import numpy as np
import datetime

from geojson import Point, Feature, FeatureCollection, dump

from opt.exif import get_exif_of_image
from opt.mapping import dms2deg
from opt.makemap import putMarker, putLine



imagesDirPath = os.path.join(os.getcwd(), "datas/画像/")
imagesDirPath = "G:\\マイドライブ\\Forest\\photoImages\\20211010\\JPG\\"

imgPaths = glob(imagesDirPath + "*.")

imgPaths = [p for p in glob(f'{imagesDirPath}**', recursive=True)
       if re.search('\d+\.(jpg|png)', p)]


len(imgPaths)


EXIFINFOS = ['GPSInfo', 'ResolutionUnit', 'XResolution', 'YResolution','CompressedBitsPerPixel', 'DateTimeOriginal', 'FocalLength', 'ExifImageWidth', 'ExifImageHeight']
longitudes = []
latitudes = []
takedTimes = []



# !pip install tqdm
from tqdm import tqdm_notebook as tqdm

ft_all = []

out_geojson = "./outtest.geojson"

for path in tqdm(imgPaths):
    print(path)
    exifDict = get_exif_of_image(path, EXIFINFOS)
    takedTime = datetime.datetime.strptime(exifDict['DateTimeOriginal'], '%Y:%m:%d %H:%M:%S')
    # takedTimeStr = takedTime.strftime('%Y年%m月%d日_%H:%M')
    
    lon = dms2deg(tuple(exifDict['GPSInfo'][2]))
    lat = dms2deg(tuple(exifDict['GPSInfo'][4]))

#     geojsonでは型指定できない　すべてStringへ変換
    ft = Feature(geometry = Point((lon,lat,)),
                 properties = {'image_FilePath': path,
                               'image_DateTime': str(takedTime),
                               'image_Width': str(exifDict['ExifImageWidth']),
                               'image_Height': str(exifDict['ExifImageHeight']),
                               'FocalLength': str(exifDict['FocalLength'])
                                                       })
    pprint(ft)
    ft_all.append(ft)

ft_colct = FeatureCollection(ft_all)

with open(out_geojson, 'w') as f:
    dump(ft_colct, f, indent=2)

