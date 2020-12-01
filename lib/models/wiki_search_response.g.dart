// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wiki_search_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WikiSearchResponseAdapter extends TypeAdapter<WikiSearchResponse> {
  @override
  final int typeId = 0;

  @override
  WikiSearchResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WikiSearchResponse(
      batchcomplete: fields[0] as bool,
      wikiSearchResponseContinue: fields[1] as Continue,
      query: fields[2] as Query,
    );
  }

  @override
  void write(BinaryWriter writer, WikiSearchResponse obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.batchcomplete)
      ..writeByte(1)
      ..write(obj.wikiSearchResponseContinue)
      ..writeByte(2)
      ..write(obj.query);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WikiSearchResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QueryAdapter extends TypeAdapter<Query> {
  @override
  final int typeId = 1;

  @override
  Query read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Query(
      redirects: (fields[0] as List)?.cast<Redirect>(),
      pages: (fields[1] as List)?.cast<ResultPage>(),
    );
  }

  @override
  void write(BinaryWriter writer, Query obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.redirects)
      ..writeByte(1)
      ..write(obj.pages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QueryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ResultPageAdapter extends TypeAdapter<ResultPage> {
  @override
  final int typeId = 2;

  @override
  ResultPage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResultPage(
      pageid: fields[0] as int,
      ns: fields[1] as int,
      title: fields[2] as String,
      index: fields[3] as int,
      thumbnail: fields[4] as Thumbnail,
      terms: fields[5] as Terms,
    );
  }

  @override
  void write(BinaryWriter writer, ResultPage obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.pageid)
      ..writeByte(1)
      ..write(obj.ns)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.index)
      ..writeByte(4)
      ..write(obj.thumbnail)
      ..writeByte(5)
      ..write(obj.terms);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultPageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TermsAdapter extends TypeAdapter<Terms> {
  @override
  final int typeId = 3;

  @override
  Terms read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Terms(
      description: (fields[0] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Terms obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TermsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ThumbnailAdapter extends TypeAdapter<Thumbnail> {
  @override
  final int typeId = 4;

  @override
  Thumbnail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Thumbnail(
      source: fields[0] as String,
      width: fields[1] as int,
      height: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Thumbnail obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.source)
      ..writeByte(1)
      ..write(obj.width)
      ..writeByte(2)
      ..write(obj.height);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThumbnailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RedirectAdapter extends TypeAdapter<Redirect> {
  @override
  final int typeId = 5;

  @override
  Redirect read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Redirect(
      index: fields[0] as int,
      from: fields[1] as String,
      to: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Redirect obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.from)
      ..writeByte(2)
      ..write(obj.to);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RedirectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ContinueAdapter extends TypeAdapter<Continue> {
  @override
  final int typeId = 6;

  @override
  Continue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Continue(
      gpsoffset: fields[0] as int,
      continueContinue: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Continue obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.gpsoffset)
      ..writeByte(1)
      ..write(obj.continueContinue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContinueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
