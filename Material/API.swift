//  This file was automatically generated and should not be edited.

import Apollo

public final class AllFilmsQuery: GraphQLQuery {
  public static let operationDefinition =
    "query AllFilms {" +
    "  allFilms {" +
    "    __typename" +
    "    films {" +
    "      __typename" +
    "      id" +
    "      episodeID" +
    "      title" +
    "      releaseDate" +
    "      director" +
    "    }" +
    "  }" +
    "}"
  public init() {
  }

  public struct Data: GraphQLMappable {
    public let allFilms: AllFilm?

    public init(reader: GraphQLResultReader) throws {
      allFilms = try reader.optionalValue(for: Field(responseName: "allFilms"))
    }

    public struct AllFilm: GraphQLMappable {
      public let __typename: String
      public let films: [Film?]?

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        films = try reader.optionalList(for: Field(responseName: "films"))
      }

      public struct Film: GraphQLMappable {
        public let __typename: String
        public let id: GraphQLID
        public let episodeId: Int?
        public let title: String?
        public let releaseDate: String?
        public let director: String?

        public init(reader: GraphQLResultReader) throws {
          __typename = try reader.value(for: Field(responseName: "__typename"))
          id = try reader.value(for: Field(responseName: "id"))
          episodeId = try reader.optionalValue(for: Field(responseName: "episodeID"))
          title = try reader.optionalValue(for: Field(responseName: "title"))
          releaseDate = try reader.optionalValue(for: Field(responseName: "releaseDate"))
          director = try reader.optionalValue(for: Field(responseName: "director"))
        }
      }
    }
  }
}

public final class AllPeopleQuery: GraphQLQuery {
  public static let operationDefinition =
    "query AllPeople {" +
    "  allPeople {" +
    "    __typename" +
    "    people {" +
    "      __typename" +
    "      name" +
    "      birthYear" +
    "      imageUrl" +
    "      species {" +
    "        __typename" +
    "        name" +
    "      }" +
    "      starshipConnection {" +
    "        __typename" +
    "        starships {" +
    "          __typename" +
    "          name" +
    "        }" +
    "      }" +
    "      vehicleConnection {" +
    "        __typename" +
    "        vehicles {" +
    "          __typename" +
    "          name" +
    "        }" +
    "      }" +
    "      homeworld {" +
    "        __typename" +
    "        name" +
    "      }" +
    "    }" +
    "  }" +
    "}"
  public init() {
  }

  public struct Data: GraphQLMappable {
    public let allPeople: AllPerson?

    public init(reader: GraphQLResultReader) throws {
      allPeople = try reader.optionalValue(for: Field(responseName: "allPeople"))
    }

    public struct AllPerson: GraphQLMappable {
      public let __typename: String
      public let people: [Person?]?

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        people = try reader.optionalList(for: Field(responseName: "people"))
      }

      public struct Person: GraphQLMappable {
        public let __typename: String
        public let name: String?
        public let birthYear: String?
        public let imageUrl: String?
        public let species: Species?
        public let starshipConnection: StarshipConnection?
        public let vehicleConnection: VehicleConnection?
        public let homeworld: Homeworld?

        public init(reader: GraphQLResultReader) throws {
          __typename = try reader.value(for: Field(responseName: "__typename"))
          name = try reader.optionalValue(for: Field(responseName: "name"))
          birthYear = try reader.optionalValue(for: Field(responseName: "birthYear"))
          imageUrl = try reader.optionalValue(for: Field(responseName: "imageUrl"))
          species = try reader.optionalValue(for: Field(responseName: "species"))
          starshipConnection = try reader.optionalValue(for: Field(responseName: "starshipConnection"))
          vehicleConnection = try reader.optionalValue(for: Field(responseName: "vehicleConnection"))
          homeworld = try reader.optionalValue(for: Field(responseName: "homeworld"))
        }

        public struct Species: GraphQLMappable {
          public let __typename: String
          public let name: String?

          public init(reader: GraphQLResultReader) throws {
            __typename = try reader.value(for: Field(responseName: "__typename"))
            name = try reader.optionalValue(for: Field(responseName: "name"))
          }
        }

        public struct StarshipConnection: GraphQLMappable {
          public let __typename: String
          public let starships: [Starship?]?

          public init(reader: GraphQLResultReader) throws {
            __typename = try reader.value(for: Field(responseName: "__typename"))
            starships = try reader.optionalList(for: Field(responseName: "starships"))
          }

          public struct Starship: GraphQLMappable {
            public let __typename: String
            public let name: String?

            public init(reader: GraphQLResultReader) throws {
              __typename = try reader.value(for: Field(responseName: "__typename"))
              name = try reader.optionalValue(for: Field(responseName: "name"))
            }
          }
        }

        public struct VehicleConnection: GraphQLMappable {
          public let __typename: String
          public let vehicles: [Vehicle?]?

          public init(reader: GraphQLResultReader) throws {
            __typename = try reader.value(for: Field(responseName: "__typename"))
            vehicles = try reader.optionalList(for: Field(responseName: "vehicles"))
          }

          public struct Vehicle: GraphQLMappable {
            public let __typename: String
            public let name: String?

            public init(reader: GraphQLResultReader) throws {
              __typename = try reader.value(for: Field(responseName: "__typename"))
              name = try reader.optionalValue(for: Field(responseName: "name"))
            }
          }
        }

        public struct Homeworld: GraphQLMappable {
          public let __typename: String
          public let name: String?

          public init(reader: GraphQLResultReader) throws {
            __typename = try reader.value(for: Field(responseName: "__typename"))
            name = try reader.optionalValue(for: Field(responseName: "name"))
          }
        }
      }
    }
  }
}

public final class AllPlanetsQuery: GraphQLQuery {
  public static let operationDefinition =
    "query AllPlanets {" +
    "  allPlanets {" +
    "    __typename" +
    "    planets {" +
    "      __typename" +
    "      name" +
    "      imageUrl" +
    "      terrains" +
    "      population" +
    "      orbitalPeriod" +
    "      diameter" +
    "    }" +
    "  }" +
    "}"
  public init() {
  }

  public struct Data: GraphQLMappable {
    public let allPlanets: AllPlanet?

    public init(reader: GraphQLResultReader) throws {
      allPlanets = try reader.optionalValue(for: Field(responseName: "allPlanets"))
    }

    public struct AllPlanet: GraphQLMappable {
      public let __typename: String
      public let planets: [Planet?]?

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        planets = try reader.optionalList(for: Field(responseName: "planets"))
      }

      public struct Planet: GraphQLMappable {
        public let __typename: String
        public let name: String?
        public let imageUrl: String?
        public let terrains: [String?]?
        public let population: Int?
        public let orbitalPeriod: Int?
        public let diameter: Int?

        public init(reader: GraphQLResultReader) throws {
          __typename = try reader.value(for: Field(responseName: "__typename"))
          name = try reader.optionalValue(for: Field(responseName: "name"))
          imageUrl = try reader.optionalValue(for: Field(responseName: "imageUrl"))
          terrains = try reader.optionalList(for: Field(responseName: "terrains"))
          population = try reader.optionalValue(for: Field(responseName: "population"))
          orbitalPeriod = try reader.optionalValue(for: Field(responseName: "orbitalPeriod"))
          diameter = try reader.optionalValue(for: Field(responseName: "diameter"))
        }
      }
    }
  }
}