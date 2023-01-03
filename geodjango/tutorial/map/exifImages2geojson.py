#!/usr/bin/env python
# coding: utf-8

from re import X
from tqdm import tqdm as tqdm
import os, re
from pprint import pprint
from glob import glob
import datetime


# ライブラリ読み込み
from PIL import Image
from PIL.ExifTags import TAGS

from geojson import Point, Feature, FeatureCollection, dump




# 関数の定義 01
def get_exif_of_image(filePath:str, getKeys:list):
    """Get EXIF of an image if exists.

    指定した画像のEXIFデータを取り出す関数
    @return exif_table Exif データを格納した辞書
    """
    im = Image.open(filePath)

    # Exif データを取得
    # 存在しなければそのまま終了 空の辞書を返す
    try:
        exif = im._getexif()
    except AttributeError:
        return {}

    # タグIDそのままでは人が読めないのでデコードして
    # テーブルに格納する
    exif_table = {}
    for tag_id, value in exif.items():
        tag = TAGS.get(tag_id, tag_id)
        if tag in getKeys:
            exif_table[tag] = value

    return exif_table

# print(get_exif_of_image("sample.jpg"))
# => Exif 情報を格納した辞書
#    Exif 情報がない場合には空の辞書

import math
from decimal import Decimal, ROUND_HALF_UP

def dms2deg(dms):
    '''
    (度,分,秒)list　or タプルで受け取る
    '''
    # 度分秒から度への変換 InvalidOperation: [<class 'decimal.ConversionSyntax'>]対策のためfloatへ
    h = float(dms[0])
    m = float(dms[1])
    s = float(dms[2])
    
    
    # print("Decimal:",Decimal(str(h + (m / 60) + (s / 3600))))
    
    deg = Decimal(str(h + (m / 60) + (s / 3600))).quantize(Decimal('0.0001'), rounding=ROUND_HALF_UP)
    return float(deg)

def deg2dms(deg):
    # 度から度分秒への変換
    h = math.modf(deg)[1]
    m = math.modf(math.modf(deg)[0] * 60)[1]
    s = math.modf(math.modf(deg)[0] * 60)[0]*60
    if Decimal(str(s)).quantize(Decimal('0'), rounding=ROUND_HALF_UP) == 60:
        s = 0
        m = m + 1
    if Decimal(str(m)).quantize(Decimal('0'), rounding=ROUND_HALF_UP) == 60:
        m = 0
        h = h + 1
    dms_tap = (int(Decimal(h).quantize(Decimal('0'), rounding=ROUND_HALF_UP)),
                int(Decimal(m).quantize(Decimal('0'), rounding=ROUND_HALF_UP)),
                int(Decimal(s).quantize(Decimal('0'), rounding=ROUND_HALF_UP)))
    return dms_tap



def convertImage2Geojson(imageDirPath:str, out_geojsonPath:str):

    imgPaths = [p for p in glob(f'{imageDirPath}**', recursive=True)
        if re.search('\d+\.(jpg|png)', p)]

    EXIFINFOS = ['GPSInfo', 'ResolutionUnit', 'XResolution', 'YResolution','CompressedBitsPerPixel', 'DateTimeOriginal', 'FocalLength', 'ExifImageWidth', 'ExifImageHeight']
    longitudes = []
    latitudes = []
    takedTimes = []



    ft_all = []


    for path in tqdm(imgPaths):
        # print(path)
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
        # pprint(ft)
        ft_all.append(ft)

    ft_colct = FeatureCollection(ft_all)


    with open(out_geojsonPath, 'w') as f:
        dump(ft_colct, f, indent=2)
    print("COnverted!\n",out_geojsonPath)


imagesDirPath = "G:\\マイドライブ\\Forest\\photoImages\\20211010\\JPG\\"


out_geojson = "D:\\OneDrive\\Document\\GitHub\\geodjangomapapp\\geodjango\\tutorial\\map\\data\\Forest_photoImages_20211010_JPG.geojson"

convertImage2Geojson(imagesDirPath,out_geojson)
