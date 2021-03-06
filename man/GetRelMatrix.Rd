% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GetRelMatrix.R
\name{GetRelMatrix}
\alias{GetRelMatrix}
\title{Estimate relationship matrix based on pedigree or genomic data}
\usage{
GetRelMatrix(datatype = NULL, plinkbasefile = NULL, is.binary = FALSE,
  transpose = FALSE, header = FALSE, path2Plink = "plink",
  weight = "freq", gwaa.data = NULL, pedigreefile = NULL)
}
\arguments{
\item{datatype}{character, \code{"pedigree"} or \code{"genomic"}.
Estimate the relationship matrix using either pedigree
information or genotype data}

\item{plinkbasefile}{character, path to files in plink format. E.g.
if you have files \code{test.ped} and \code{test.map},
plinkbasefile should be \code{test}. More details are also given in the vignette.}

\item{is.binary}{logical, indicate whether the plink files are in
binary format (\code{.bed}/\code{.bim}/\code{.fam})}

\item{transpose}{logical, indicate whether the plink text files are
transposed or not (\code{.tped} and \code{.tfam} files)}

\item{header}{logical, indicate whether the input text files have
header or not}

\item{path2Plink}{character, path to the binary (executable file)
of plink_1.90 or later (the Plink_1.90 binary is used for
efficient computation of the relationship matrix). More details are also given in the 
vignette.}

\item{weight}{character, either \code{"no"} or \code{"freq"}. We
suggest to use \code{weight="freq"}, which weighs by allelic
frequency assuming HWE. See help for the \code{ibs()} function
of the
\href{https://cran.r-project.org/web/packages/GenABEL/}{GenABEL
package}}

\item{gwaa.data}{object, name of object gwaa.data-class, which is
GenABEL genotype/phenotype data format}

\item{pedigreefile}{reserved for future development}
}
\value{
matrix object which contains the estimated relationship
    matrix
}
\description{
Estimate relationship matrix based on pedigree or genomic data.
This function can use either Plink files as input (for both
pedigree-based and genomic relationship matrix calculation), or
genetic data in GenABEL format (for genomic relationships).
}
\details{
Note that, with respect to the input parameters it is important to
    distinguish the two options of \code{datatype}. If
    \code{datatype} is equal to \code{"pedigree"} the user should
    specify the options \code{plinkbasefile}, \code{is.binary},
    \code{transpose}, \code{header} and \code{path2Plink}. In that
    case, the kinship will be estimated based on the pedigree data
    in the Plink files. If, however, \code{datatype} is equal to
    \code{"genomic"}, there are two options: either one uses the
    parameter \code{gwaa.data} to tell this function to compute the
    genomics relationship matrix from a previously stored GenABEL
    data object. Or, if \code{gwaa.data} is empty, the
    Plink-related parameters have to be specified and the genomics
    relationship matrix will be computed based on the genetic data
    in the Plink file.
}
\examples{
system.file("extdata", "2012.csv", package = "testdat")
\dontrun{
pedRel <- GetRelMatrix(datatype="pedigree",
                       plinkbasefile=system.file("extdata",
                                                 "data",
                                         package="RVPedigree"),
                       transpose=FALSE)
pedRel <- GetRelMatrix(datatype="pedigree",
                       plinkbasefile=system.file("extdata",
                                                 "dataT",
                                         package="RVPedigree"),
                       transpose=TRUE)
pedRel <- GetRelMatrix(datatype="pedigree",
                       plinkbasefile=system.file("extdata",
                                                 "dataB",
                                         package="RVPedigree"),
                       is.binary=TRUE)
pedRel <- GetRelMatrix(datatype="pedigree",
                       plinkbasefile=system.file("extdata",
                                                 "OneFamilyExample",
                                         package="RVPedigree"),
                       transpose=FALSE, header=TRUE)
pedRel <- GetRelMatrix(datatype="pedigree",
                       plinkbasefile=system.file("extdata",
                                                 "TwoFamilyExample",
                                         package="RVPedigree"),
                       transpose=FALSE, header=TRUE)

load(system.file("extdata", "gwaa.data.RData")
genRel <- GetRelMatrix(datatype="genomic", gwaa.data=data1, weight="no")
genRel <- GetRelMatrix(datatype="genomic", gwaa.data=data1, weight="freq")
genRelError <- GetRelMatrix(datatype="genomic", gwaa.data=pedRel, weight="freq")

genPlinkRel <- GetRelMatrix(data="genomic",
                            path2Plink="plink_1.90",
                            system.file("extdata",
                                        "data",
                                         package="RVPedigree"),
genPlinkRel[1:10, 1:10]

genPlinkRel <- GetRelMatrix(data="genomic",
                            path2Plink="plink_1.90",
                            system.file("extdata",
                                        "dataT",
                                         package="RVPedigree"),
                            transpose=TRUE)
genPlinkRel[1:10, 1:10]

genPlinkRel <- GetRelMatrix(data="genomic",
                            path2Plink="plink_1.90",
                            system.file("extdata",
                                        "dataB",
                                         package="RVPedigree"),
                            is.binary=TRUE)
genPlinkRel[1:10, 1:10]

# GetRelMatrix(file="OneFamilyExample.ped", datatype="genomic")
# GetRelMatrix(file="OneFamilyExample.ped", datatype="pedasdfa")
# GetRelMatrix(file="OneFamilyExaample", datatype="pedigree")
}

}
\author{
Sodbo Sharapov
}

