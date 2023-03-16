import 'package:json_annotation/json_annotation.dart';
import 'package:radio_browser_api/src/_util/type_convertors.dart';

part 'station.g.dart';

/// {@template station_struct}
/// This struct is used to represent a radio station.
/// {@endtemplate}
@JsonSerializable()
class Station {
  /// {@macro station_struct}
  const Station({
    required this.changeUUID,
    required this.stationUUID,
    required this.serverUUID,
    required this.name,
    required this.url,
    required this.urlResolved,
    required this.homepage,
    required this.favicon,
    required this.tags,
    @Deprecated('Use countrycode instead, full name of the country.')
        required this.country,
    required this.countryCode,
    required this.state,
    required this.language,
    required this.languageCodes,
    required this.votes,
    required this.lastChangeTime,
    required this.codec,
    required this.bitrate,
    required this.hls,
    required this.lastCheckOk,
    required this.lastCheckTime,
    required this.lastCheckOkTime,
    required this.lastLocalCheckTime,
    required this.clickTimestamp,
    required this.clickCount,
    required this.clickTrend,
    required this.sslError,
    required this.geoLat,
    required this.geoLong,
    required this.hasExtendedInfo,
  });

  /// {@macro station_struct}
  factory Station.fromJson(Map<String, dynamic> json) =>
      _$StationFromJson(json);

  /// A globally unique identifier for the change of the station information
  @JsonKey(name: 'changeuuid')
  final String changeUUID;

  /// A globally unique identifier for the station
  @JsonKey(name: 'stationuuid')
  final String stationUUID;

  /// A unique identifier for the server
  @JsonKey(name: 'serveruuid')
  final String? serverUUID;

  /// The name of the station
  final String name;

  /// The stream URL provided by the user
  final String url;

  /// An automatically "resolved" stream URL. Things resolved are playlists
  /// (M3U/PLS/ASX...), HTTP redirects (Code 301/302). This link is especially
  /// useful if you use this API from a platform that is not able to do a
  /// resolve on its own (e.g. JavaScript in browser) or you just don't want
  /// to invest the time in decoding playlists yourself.
  @JsonKey(name: 'url_resolved', fromJson: stringToNull)
  final String? urlResolved;

  /// URL to the homepage of the stream, so you can direct the user to a page
  /// with more information about the stream.
  @JsonKey(fromJson: stringToNull)
  final String? homepage;

  /// URL to an icon or picture that represents the stream. (PNG, JPG)
  @JsonKey(fromJson: stringToNull)
  final String? favicon;

  /// Tags of the stream with more information about it
  @JsonKey(fromJson: stringToNull)
  final String? tags;

  /// Currently it is autogenerated from the countrycode.
  @Deprecated('Use countrycode instead, full name of the country.')
  final String country;

  /// Official countrycodes as in ISO 3166-1 alpha-2.
  @JsonKey(name: 'countrycode')
  final String countryCode;

  /// Full name of the entity where the station is located inside the country
  @JsonKey(fromJson: stringToNull)
  final String? state;

  /// Languages that are spoken in this stream, separated by comma.
  @JsonKey(fromJson: stringToNull)
  final String? language;

  /// Languages that are spoken in this stream by code ISO 639-2/B, separated
  /// by comma.
  @JsonKey(name: 'languagecodes', fromJson: stringToNull)
  final String? languageCodes;

  /// Number of votes for this station. This number is by server and only ever
  /// increases. It will never be reset to 0.
  final int votes;

  /// Last time when the stream information was changed in the database
  @JsonKey(name: 'lastchangetime', fromJson: DateTime.parse)
  final DateTime lastChangeTime;

  /// The codec of this stream recorded at the last check.
  @JsonKey(fromJson: stringToNull)
  final String? codec;

  /// The bitrate of this stream recorded at the last check.
  final int bitrate;

  /// Mark if this stream is using HLS distribution or non-HLS.
  @JsonKey(fromJson: boolFromInt, toJson: intFromBool)
  final bool hls;

  /// The current online/offline state of this stream. This is a value
  /// calculated from multiple measure points in the internet. The test
  /// servers are located in different countries. It is a majority vote.
  @JsonKey(name: 'lastcheckok', fromJson: boolFromInt, toJson: intFromBool)
  final bool lastCheckOk;

  /// The last time when any radio-browser server checked the online state
  /// of this stream
  @JsonKey(name: 'lastchecktime', fromJson: DateTime.tryParse)
  final DateTime? lastCheckTime;

  /// The last time when the stream was checked for the online status
  /// with a positive result
  @JsonKey(name: 'lastcheckoktime', fromJson: DateTime.tryParse)
  final DateTime? lastCheckOkTime;

  /// The last time when this server checked the online state and the
  /// metadata of this stream
  @JsonKey(name: 'lastlocalchecktime', fromJson: DateTime.tryParse)
  final DateTime? lastLocalCheckTime;

  /// The time of the last click recorded for this stream
  @JsonKey(name: 'clicktimestamp', fromJson: DateTime.tryParse)
  final DateTime? clickTimestamp;

  /// Clicks within the last 24 hours
  @JsonKey(name: 'clickcount')
  final int clickCount;

  /// The difference of the clickcounts within the last 2 days.
  /// Posivite values mean an increase, negative a decrease of clicks.
  @JsonKey(name: 'clicktrend')
  final int clickTrend;

  /// Whether there was an ssl error while connecting to the stream url.
  @JsonKey(name: 'ssl_error', fromJson: boolFromInt, toJson: intFromBool)
  final bool sslError;

  /// Latitude on earth where the stream is located.
  @JsonKey(name: 'geo_lat')
  final double? geoLat;

  /// Longitude on earth where the stream is located.
  @JsonKey(name: 'geo_long')
  final double? geoLong;

  /// Is true, if the stream owner does provide extended information as HTTP
  /// headers which override the information in the database.
  @JsonKey(name: 'has_extended_info')
  final bool hasExtendedInfo;

  /// Convert a [Station] instance to a JSON object.
  Map<String, dynamic> toJson() => _$StationToJson(this);
}
