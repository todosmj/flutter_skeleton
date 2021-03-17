import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable {
  final String prdSeq; //상품 고유값
  final String prdNm; //상품명
  final String categorySeq1; //카테고리1
  final String categorySeq2; //카테고리2
  final String categorySeq3; //카테고리3
  final String categoryNm ;
  final String sizeCd; //사이즈 시퀀스
  final String sizeNm; //사이즈 명
  final String brandNm; //브랜드명
  final String wearStatusCd; //상품 상태 코드
  final String genderStatusCd; //상품 성별 코드
  final String seasonStatusCd; //계절감
  final String contents; //상세내용
  final String tags; //태그
  final int chatCnt;
  final int appointCnt;
  final String creDt; //등록일

  Product({
    @required this.prdSeq,
    @required this.prdNm,
    this.categorySeq1,
    this.categorySeq2,
    this.categorySeq3,
    this.categoryNm,
    this.sizeCd,
    this.sizeNm,
    this.brandNm,
    this.wearStatusCd,
    this.genderStatusCd,
    this.seasonStatusCd,
    this.contents,
    this.tags,
    this.chatCnt,
    this.appointCnt,
    this.creDt,
  });

  factory Product.fromJSON(Map product) {
    return Product(
      prdSeq: product['prdSeq'],
      prdNm: product['prdNm'],
      categorySeq1: product['categorySeq1'],
      categorySeq2: product['categorySeq2'],
      categorySeq3: product['categorySeq3'],
      categoryNm: product['categoryNm'],
      sizeCd: product['sizeCd'],
      sizeNm: product['sizeNm'],
      brandNm: product['brandNm'],
      wearStatusCd: product['wearStatusCd'],
      genderStatusCd: product['genderStatusCd'],
      seasonStatusCd: product['seasonStatusCd'],
      contents: product['contents'],
      tags: product['sizeNm'],
      chatCnt: product['chatCnt'],
      appointCnt: product['appointCnt'],
      creDt: product['creDt'],
    );
  }

  @override
  List<Object> get props => [prdSeq, prdNm, categorySeq1, categorySeq2, categorySeq3, categoryNm, sizeCd, sizeNm, brandNm, wearStatusCd, genderStatusCd, seasonStatusCd, contents, tags, chatCnt, appointCnt, creDt];
}